require 'spec_helper'

describe Dealer do
  describe '#current' do
    it 'returns cards in the player hand' do
      player = Dealer.new
      player.cards << Card.new('5♥')
      expect(player.current).to eq '1. Dealer was dealt 5♥'
    end
  end
end
