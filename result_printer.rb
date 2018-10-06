class ResultPrinter
  def initialize
    @status_image = []

    counter = 0

    while counter <= 7
      file_name = File.dirname(__FILE__) + "/image/#{counter}.txt"

      begin
        file = File.new(file_name, "r:UTF-8")
        @status_image << file.read
        file.close
        counter += 1
      rescue SystemCallError
        @status_image << "\n [ изображение не найдено ] \n"
      end
    end
  end

  def print_status(game)
    cls

    puts "\nСлово " + get_word_for_print(game.letters, game.good_letters)

    puts "Ошибки (#{game.errors}): #{game.bad_letters.join(", ")}"

    print_viselitsya(game.errors)

    if game.status == -1
      puts
      puts "Вы проиграли :("
      puts "Загаданное слово было: " + game.letters.join("")
      puts
    elsif game.status == 1
      puts
      puts "Поздравляем, вы выиграли!"
      puts
    else
      puts "У вас осталось ошибок: " + (7 - game.errors).to_s
    end
  end

  def get_word_for_print(letters, good_letters)
  result = ""

    letters.each do |letter|
      if good_letters.include?(letter)
        result += letter + " "
      else
        result += "__ "
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
