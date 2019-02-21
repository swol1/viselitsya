class Game
  attr_reader :errors, :letters, :good_letters, :bad_letters, :status
  attr_accessor :version

  MAX_ERRORS = 7

  def initialize(slovo)
    @letters = get_letters(slovo)
    @errors = 0
    @good_letters = []
    @bad_letters = []

    @status = :in_progress
  end

  def get_letters(slovo)
    slovo.encode('UTF-8').downcase.split("")
  end

  def max_errors
    MAX_ERRORS
  end

  def errors_left
    MAX_ERRORS - @errors
  end

  def good?(letter)
    @letters.include?(letter) ||
    letter == "е" && @letters.include?("ё") ||
    letter == "ё" && @letters.include?("е") ||
    letter == "й" && @letters.include?("и") ||
    letter == "и" && @letters.include?("й")
  end

  def add_letter_to(letters, letter)
    letters << letter

    case letter
    when 'и'
      letters << 'й'
    when 'й'
      letters << 'и'
    when 'е'
      letters << 'ё'
    when 'ё'
      letters << 'е'
    end
  end

  def solved?
    (@letters - @good_letters).empty?
  end

  def repeated?(letter)
    @good_letters.include?(letter) || @bad_letters.include?(letter)
  end

  def lost?
    @status == :lost || @errors >= MAX_ERRORS
  end

  def in_progress?
    @status == :in_progress
  end

  def won?
    @status == :won
  end

  def ask_next_letter
    puts
    puts "Введите следующую букву"

    letter = ""
    letter = STDIN.gets.encode("UTF-8").chomp.downcase while letter == ""
    next_step(letter)
  end

  def next_step(letter)
    return if @status == :lost || @status == :won
    return if repeated?(letter)

    if good?(letter)
      add_letter_to(@good_letters, letter)
      @status = :won if solved?
    else
      add_letter_to(@bad_letters, letter)
      @errors += 1
      @status = :lost if lost?
    end
  end
end
