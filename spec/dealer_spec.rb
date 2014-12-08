require 'spec_helper'

describe Dealer do
  describe '#current' do
    it 'returns cards in the player hand' do
      player = Dealer.new
      player.cards << Card.new('5♥')
      expect(player.current).to eq '1. Dealer was dealt 5♥'
    end
  end

  describe '#last_dealt' do
    it 'returns the last card in the players hand' do
      dealer = Dealer.new
      dealer.cards << Card.new('5♥')
      dealer.cards << Card.new('9♥')
      expect(dealer.last_dealt).to eq "2. Dealer was dealt 9♥"
    end
  end
end
