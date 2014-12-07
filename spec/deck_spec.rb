require 'spec_helper'

describe Deck do
  describe '#deal' do
    it 'deals the first card of the deck' do
      expect(Deck.new.deal.value).to eq 'Ace♣'
    end
  end

  describe '#shuffle' do
    it 'calls shuffle on the array of cards' do
      deck = Deck.new
      deck.shuffle
      expect(deck.deal.value).not_to eq 'Ace♣'
    end
  end
end
