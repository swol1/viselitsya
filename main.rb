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

require 'colorize'

VERSION = "Игра Виселица. Версия 5"

reader = WordReader.new
words_file_name = "#{File.dirname(__FILE__)}/data/words.txt"

slovo = ARGV[0] ||= reader.read_from_file(words_file_name)

game = Game.new(slovo)
game.version = VERSION.colorize(:blue)

printer = ResultPrinter.new(game)

while game.in_progress?
  printer.print_status(game)
  game.ask_next_letter
end

printer.print_status(game)
