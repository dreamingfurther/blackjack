require 'spec_helper'

describe Player do
  describe '#current' do
    it 'returns cards in the player hand' do
      player = Player.new
      player.cards << Card.new('5♥')
      expect(player.current).to eq '1. Player was dealt 5♥'
    end
  end

  describe '#last_dealt' do
    it 'returns the last card in the players hand' do
      player = Player.new
      player.cards << Card.new('5♥')
      player.cards << Card.new('9♥')
      expect(player.last_dealt).to eq "2. Player was dealt 9♥\n"
    end
  end
end
