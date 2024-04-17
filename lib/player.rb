class Player
  attr_accessor :game, :health
  @@base_health = 7
  def initialize(game)
    @game = game
    @health = @@base_health
    print_health()
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
  end
end
