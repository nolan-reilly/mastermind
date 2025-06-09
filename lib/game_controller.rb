require_relative './player'

# Controls the General flow of the Mastermind game
class GameController
  def initialize
    @player = Player.new
  end

  def initialize_player
    puts 'Enter Name: '
    name = gets.chomp

    puts 'Enter your code [a-z, 0-9]: '
    code = gets.chomp

    is_valid = valid_code?(code)

    return unless is_valid

    Player.new(name, code)
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

game = GameController.new
