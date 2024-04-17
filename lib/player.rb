class Player
  @@base_health = 7
  def initialize(game)
    @game = game
    @health = @@base_health
  end
end
