class Game
  def initialize(slovo)
    @letters = get_letters(slovo)

    @letters.each {|letter| letter.downcase!}

    @errors = 0

    @good_letters = []
    @bad_letters = []

    @status = 0
  end

  def get_letters(slovo)
    slovo.encode('UTF-8').split("")
  end

  def ask_next_letter
    puts
    puts "Введите следующую букву"

    letter = ""

    while letter == ""
      letter = STDIN.gets.encode("UTF-8").chomp.downcase
    end

    next_step(letter)
  end

  def next_step(bukva)
    return if @status == -1 || @status == 1

    return if @good_letters.include?(bukva) || @bad_letters.include?(bukva)

    if bukva == "е" && @letters.include?("ё")
      @good_letters << "ё"
    elsif bukva == "ё" && @letters.include?("е")
      @good_letters << "е"
    elsif bukva == "й" && @letters.include?("и")
      @good_letters << "и"
    elsif bukva == "и" && @letters.include?("й")
      @good_letters << "й"
    end

    if @letters.include?(bukva)
      @good_letters << bukva
      @status = 1 if good_letters.size == letters.uniq.size
    else
      @bad_letters << bukva
      @errors += 1
      @status = -1 if @errors >= 7
    end
  end

  def letters
    @letters
  end

  def good_letters
    @good_letters
  end

  def bad_letters
    @bad_letters
  end

  def status
    @status
  end

  def errors
    @errors
  end
end
