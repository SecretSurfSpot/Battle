class Player
  attr_reader :name, :hit_points
  HIT_POINTS = 60

  def initialize(name, hit_points=HIT_POINTS)
    @name = name
    @hit_points = hit_points
  end

  def attack_player(player)
    player.receive_damage
  end

  def receive_damage
    @hit_points -= 10
  end

end
