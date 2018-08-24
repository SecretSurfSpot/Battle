class Game
  attr_reader :turn

  def initialize(player_1, player_2)
    @turn = "player_1"
    @players = [player_1, player_2]
  end

  def player_1
    @players.first
  end

  def player_2
    @players.last
  end

  def attack(player)
    player.receive_damage
  end

  def switch
    @turn == "player_1" ? @turn = "player_2" : @turn = "player_1"
  end

end
