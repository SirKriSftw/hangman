class Player
  attr_accessor :game, :health
  @@base_health = 7
  def initialize(game)
    @game = game
    @health = @@base_health
    print_health()
    take_guess()
  end

  def take_damage()
    if(health > 0)
      health -= 1
    else
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
      if letter.length == 1 && letter.downcase.ord >= 97 && letter.downcase.ord <= 122
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
