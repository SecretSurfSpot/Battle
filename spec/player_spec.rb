require "player"

describe Player do
  player_1 = Player.new("Andrew")
  player_2 = Player.new("James")
  describe "#name" do
    it "returns a name" do
      expect(player_1.name).to eq("Andrew")
    end
  end

  describe "#hit_points" do
    it "initialize with 60 hit points" do
      expect(player_1.hit_points).to eq(Player::HIT_POINTS)
    end
  end

  describe "#attack_player" do
    it "reduced hit points" do
      # player_1.attack_player(player_2)
      expect(player_2).to receive(:receive_damage)
      #  expect(mittens).to receive(:receive_damage)
      player_1.attack_player(player_2)
    end
  end


  describe "#receive_damage" do
    it "reduced hit points" do
      expect{ player_2.receive_damage }.to change {player_2.hit_points}.by(-10)
    end
  end

end
