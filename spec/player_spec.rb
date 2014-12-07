require 'spec_helper'

describe Player do
  describe '#current' do
    it 'returns cards in the player hand' do
      player = Player.new
      player.cards << Card.new('5♥')
      expect(player.current).to eq 'Player was dealt 5♥'
    end
  end
end
