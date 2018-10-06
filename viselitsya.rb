if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative "game"
require_relative "result_printer"
require_relative "word_reader"

puts "Игра Виселица"

reader = WordReader.new
printer = ResultPrinter.new

if ARGV[0] == nil
  slovo = reader.read_from_file(File.dirname(__FILE__) + "/data/word.txt")
else
  slovo = ARGV[0]
end

game = Game.new(slovo)

while game.status == 0
  printer.print_status(game)
  game.ask_next_letter
end

printer.print_status(game)
