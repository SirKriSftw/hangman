require_relative "player"

class Game
  attr_accessor :word, :correct_letters, :guessed_letters, :player

  def initialize(word)
    @word = word
    @correct_letters = word.split("")
    correct_letters.pop
    @guessed_letters = ["e","a","i","o","u"]
    print_board()
    @player = Player.new(self)
    print_guessed_letters()
  end

  def print_board()
    correct_letters.each do |letter|
      if(guessed_letters.include?(letter))
        print "#{letter} "
      else
      print "_ "
      end
    end
    print "\t\t"
  end

  def print_guessed_letters()
    display = guessed_letters.sort()
    print "\nGuessed letters: #{display}"
  end


end
