class Player
  attr_accessor :game, :health
  @@base_health = 7

  def initialize(game)
    @game = game
    @health = @@base_health
  end

  def take_damage()
    if(health > 0)
      self.health -= 1
    else
      self.health = -1
      puts "Game Over"
    end
  end

  def print_health()
    health.times do
      print "♥ "
    end
    (@@base_health - health).times do
      print "- "
    end
    puts ""
  end

  def take_guess()
    loop do
      print "Guess a letter: "
      letter = gets
      letter = letter.chomp
      if letter.length == 1 && letter.downcase.ord >= "a".ord && letter.downcase.ord <= "z".ord
        unless game.guessed_letters.include?(letter.downcase)
          game.guessed_letters.push(letter.downcase)
          return letter
        end
        puts "#{letter} has already been guessed"
      else
      puts "#{letter} is either not a letter"
      end
    end
  end
end
