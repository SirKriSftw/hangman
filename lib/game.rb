require_relative "player"

class Game
  def initialize(word)
    @word = word
    @guessed_letters = []
    @player = Player.new(self)
  end
end
