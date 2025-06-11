require_relative './player'
require_relative './computer'
require 'colorize'

# TODO: There are repeated functions in game_controller and player maybe fix this

# Controls the General flow of the Mastermind game
class GameController
  def initialize
    @player = Player.new
    @computer = Computer.new
  end

  # FIXME: Function is too long
  def start
    puts "\nWelcome to Mastermind!"
    puts '-------------------------'

    # For testing purposes only
    # puts "Computer Code: #{@computer.code}"

    player_won = false
    computer_won = false

    round = 0
    until round == 12 || player_won || computer_won
      puts "Guesses Left: #{12 - round}"

      guess = prompt_code

      puts "\nPlayer Guess: #{print_guess(guess)}"

      correct_guess = evaluate_guess(guess)

      player_won = true if correct_guess

      computer_guess = [*'a'..'z', *'0'..'9'].sample(4).join
      puts "\nComputer Guess: #{computer_print_guess(computer_guess)}"
      computer_guess_correct = computer_evaluate_guess(computer_guess)

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

  # FIXME: Currently have two similar functions for player and computer guessing
  #        and printing, and could possibly combine them

  # Player evaluates computer
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

  def computer_print_guess(code)
    output = []

    4.times do |i|
      # If the guess is included and the correct position
      if code[i] == @player.code[i]
        output.push(code[i].colorize(:green))
        next
      elsif @player.code.include? code[i] # If the guess is included but not the same position
        output.push(code[i].colorize(:yellow))
      else
        output.push(code[i])
      end
    end

    output.join(' ')
  end

  # Computer Evaluates
  def computer_evaluate_guess(code)
    return true if code == @player.code

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
