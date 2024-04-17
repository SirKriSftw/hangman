require_relative "player"

class Game
  attr_accessor :word, :correct_letters, :guessed_letters, :player, :guessed

  def initialize(word)
    @word = word
    @correct_letters = word.split("")
    correct_letters.pop
    @guessed_letters = []
    @guessed = false
    @player = Player.new(self)
  end

  def play()
    while(!guessed && player.health >= 0) do
      print_board()
      player.print_health()
      check_letter_guess(player.take_guess())
      print_guessed_letters()
    end
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
    puts "\nGuessed letters: #{display}"
  end

  def check_letter_guess(letter)
    unless correct_letters.include?(letter)
      player.take_damage()
    end
    check_win()
  end

  def check_win()
    if (correct_letters.all? { |letter| guessed_letters.include?(letter)})
      self.guessed = true
      puts "You win!"
    end
  end
end
