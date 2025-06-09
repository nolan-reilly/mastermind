require_relative './player'

# TODO: Work on player guessing loop
# TODO: Add a computer turn with randomized guesses
# TODO: There are repeated functions in game_controller and player maybe fix this

# Controls the General flow of the Mastermind game
class GameController
  def initialize
    @player = Player.new
  end

  def start
    puts "\nWelcome to Mastermind!"
    puts '-------------------------'

    round = 0
    until round == 12
      code = prompt_code

      round += 1
    end
  end

  private

  def evaluate_guess(code)
    # TODO: Work on game logic for checking player guess
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

game = GameController.new
game.start
