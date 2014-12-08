require 'spec_helper' 

describe Hand do
  describe '#score' do
    it 'calls adjust_aces with the raw_score' do
      hand = Hand.new
      card1 = Card.new('5♥')
      card2 = Card.new('9♥')
      hand.cards << card1
      hand.cards << card2
      expect(Card).to receive(:adjust_aces).with(14, [card1, card2])
      hand.score
    end
  end
end
