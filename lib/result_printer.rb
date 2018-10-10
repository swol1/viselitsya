class ResultPrinter
  def initialize(game)
    @status_image = []

    counter = 0

    while counter <= game.max_errors
      file_name = File.dirname(__FILE__) + "/../image/#{counter}.txt"

      begin
        file = File.new(file_name, "r:UTF-8")
        @status_image << file.read
        file.close
      rescue SystemCallError
        @status_image << "\n [ изображение не найдено ] \n"
      end

      counter += 1
    end
  end

  def print_status(game)
    cls
    puts game.version

    puts "\nСлово " + get_word_for_print(game.letters, game.good_letters)

    puts "Ошибки (#{game.errors}): #{game.bad_letters.join(", ")}"

    print_viselitsya(game.errors)

    if game.lost?
      puts
      puts "Вы проиграли :("
      puts "Загаданное слово было: " + game.letters.join("")
      puts
    elsif game.won?
      puts
      puts "Поздравляем, вы выиграли!"
      puts
    else
      puts "У вас осталось ошибок: #{game.errors_left}"
    end
  end

  def get_word_for_print(letters, good_letters)
  result = ""

  letters.each do |letter|
    result += if good_letters.include?(letter)
                letter + " "
              else
                "__ "
              end
  end

    result
  end

  def cls
    system("cls") || system("clear")
  end

  def print_viselitsya(errors)
    puts @status_image[errors]
  end
end
