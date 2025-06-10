require_relative './player'
require_relative './computer'
require 'colorize'

# TODO: Add a computer turn with randomized guesses

# TODO: Fix computer guesses colors to not use player guess, possibly add another function variable to switch
#       between computer and player

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
    computer_won = false

    round = 0
    until round == 12 || player_won || computer_won
      guess = prompt_code

      puts "\nPlayer Guess: #{print_guess(guess)}"

      correct_guess = evaluate_guess(guess)

      player_won = true if correct_guess

      computer_guess = [*'a'..'z', *'0'..'9'].sample(4).join
      puts "\nComputer Guess: #{print_guess(computer_guess)}"
      computer_guess_correct = evaluate_guess(computer_guess)

      computer_won = true if computer_guess_correct

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

  def computer_guess
    print_guess(guess)
  end

  def evaluate_guess(code)
    return true if code == @computer.code

    false
  end

  def prompt_code
    loop do
      puts "\nEnter a 4-character code (a–z, 0–9): "
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
