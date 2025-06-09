require_relative './player'

# Controls the General flow of the Mastermind game
class GameController
  def initialize
    @player = Player.new
  end
end

game = GameController.new
