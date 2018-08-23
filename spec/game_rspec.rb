require "game"

describe Game do
  game = Game.new
  player_1 = double
  player_2 = double


  describe "#attack_player" do
    it "reduced hit points" do
      # player_1.attack_player(player_2)
      expect(player_2).to receive(:receive_damage)
      #  expect(mittens).to receive(:receive_damage)
      game.attack_player(player_2)
    end
  end

end
