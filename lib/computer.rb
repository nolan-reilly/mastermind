# Represents the opponent in the mastermind game
class Computer
  attr_reader :code

  def initialize
    @code = [*'a'..'z', *'0'..'9'].sample(4).join
  end
end
