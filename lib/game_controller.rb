require_relative './player'
require_relative './computer'
require 'colorize'

# TODO: Work on player guessing loop
# TODO: Add a computer turn with randomized guesses
# TODO: There are repeated functions in game_controller and player maybe fix this

# Controls the General flow of the Mastermind game
class GameController
  def initialize
    @player = Player.new
    @computer = Computer.new
  end

  def start
    puts "\nWelcome to Mastermind!"
    puts '-------------------------'

    puts "Computer Code: #{@computer.code}"

    player_won = false

    round = 0
    until round == 12 || player_won
      code = prompt_code

      puts(print_guess(code))

      guess = evaluate_guess(code)

      player_won = true if guess

      round += 1
    end

    if player_won
      puts 'You Won!'
    else
      puts "You lost, you didn't guess the code in time..."
    end
  end

  private

  def print_guess(code)
    output = []

    4.times do |i|
      # If the guess is included and the correct position
      if code[i] == @computer.code[i]
        output.push(code[i].colorize(:green))
        next
      elsif @computer.code.include? code[i] # If the guess is included but not the same position
        output.push(code[i].colorize(:yellow))
      else
        output.push(code[i])
      end
    end

    output.join(' ')
  end

  def evaluate_guess(code)
    return true if code == @computer.code

    false
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
