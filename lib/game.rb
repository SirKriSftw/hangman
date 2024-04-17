require_relative "player"

class Game
  attr_accessor :word, :guessed_letters, :player

  def initialize(word)
    @word = word
    @guessed_letters = []
    @player = Player.new(self)
    print_board()
  end

  def print_board()
    correct_letters = word.split("")
    correct_letters.pop
    correct_letters.each {|e| print "_ "}
  end
end
