# Represents a player in mastermind
class Player
  attr_accessor :code
  attr_reader :name

  def initialize
    @name = prompt_name
    @code = prompt_code
  end

  def to_s
    "Name: #{@name}\nCode: #{@code}"
  end

  private

  def prompt_name
    loop do
      puts 'Enter Name: '

      name = gets.chomp

      if name.empty?
        puts 'Invalid name, please enter something'
        next
      end

      return name
    end
  end

  def prompt_code
    loop do
      puts 'Enter a 4-character code (a–z, 0–9): '
      code = gets.chomp

      is_valid = valid_code?(code)

      unless is_valid
        puts 'Invalid code. It must be exactly 4 characters and contain only a–z or 0–9'
        next
      end

      return code
    end
  end

  def valid_code?(code)
    return false unless code.length == 4

    code.chars.each do |c|
      next if (c >= 'a' && c <= 'z') || (c >= '0' && c <= '9')

      return false
    end

    true
  end
end
