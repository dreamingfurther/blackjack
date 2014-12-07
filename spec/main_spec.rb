require 'spec_helper'

describe Main do
  describe '#run' do
    let(:hand) { double }
    let(:deck) { double }
    let(:card) { double }

    before do
      allow(Player).to receive(:new).and_return(hand)
      allow(Dealer).to receive(:new).and_return(hand)
      allow(Deck).to receive(:new).and_return(deck)
      allow(hand).to receive(:current).and_return("5♥")
      allow(hand).to receive(:cards).and_return([])
      allow(deck).to receive(:deal).and_return(card)
      allow(deck).to receive(:shuffle)
    end

    it 'runs' do
      expect(Main.new.run).to include 'Welcome to Blackjack!'
    end

    it 'deals to the player' do
      allow(hand).to receive(:current).and_return("Player was dealt 5♥")
      expect(Main.new.run).to include 'Player was dealt 5♥'
    end

    it 'deals to the dealer' do
      allow(hand).to receive(:current).and_return("Dealer was dealt 5♥")
      expect(Main.new.run).to include 'Dealer was dealt 5♥'
    end
  end
end
