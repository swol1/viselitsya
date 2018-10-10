if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative "lib/game"
require_relative "lib/result_printer"
require_relative "lib/word_reader"

VERSION = "Игра Виселица, версия 5. (c) Хороший программист"

reader = WordReader.new
words_file_name = "#{File.dirname(__FILE__)}/data/words.txt"

if ARGV[0] == nil
  slovo = reader.read_from_file(words_file_name)
else
  slovo = ARGV[0]
end

game = Game.new(slovo)
game.version = VERSION

printer = ResultPrinter.new(game)

while game.in_progress?
  printer.print_status(game)
  game.ask_next_letter
end

printer.print_status(game)
