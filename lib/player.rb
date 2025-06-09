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
    puts 'Enter Name: '
    gets.chomp
  end

  def prompt_code
    puts 'Enter your code [a-z, 0-9]: '
    code = gets.chomp

    is_valid = valid_code?(code)

    return unless is_valid

    code
  end

  def valid_code?(code)
    return false if code.length > 4

    code.chars.each do |c|
      next if (c >= 'a' && c <= 'z') || (c >= '0' && c <= '9')

      return false
    end

    true
  end
end
