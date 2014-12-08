require 'spec_helper'

describe Deck do
  describe '#deal' do
    it 'deals the first card of the deck' do
      player = double
      allow(player).to receive(:cards).and_return([])
      Deck.new.deal_to(player)
      expect(player.cards.first.value).to eq 'Ace♣'
    end
  end

  describe '#shuffle' do
    it 'calls shuffle on the array of cards' do
      deck = Deck.new
      deck.shuffle
      expect(deck.cards.first.value).not_to eq 'Ace♣'
    end
  end
end
