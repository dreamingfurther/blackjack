require 'spec_helper'

describe Card do
  it 'sets the value of the Card' do
    expect(Card.new('10♣').value).to eq '10♣'
  end

  describe '#text' do
    it 'returns the text of the number' do
      expect(Card.new('10♣').text).to eq '10'
    end

    it 'returns the text of the face card' do
      expect(Card.new('Queen♣').text).to eq 'Queen'
    end
  end

  describe '#score' do
    it 'returns the value of the number' do
      expect(Card.new('8♣').score).to eq 8
    end

    it 'returns the 10 for the face card' do
      expect(Card.new('Queen♣').score).to eq 10
    end
  end

  describe '.adjust_for_aces' do
    it 'returns the score of the number cards' do
      card1 = Card.new('5♥')
      card2 = Card.new('9♥')
      expect(Card.adjust_for_aces(14,[card1,card2])).to eq 14
    end

    it 'returns the score of the face (non ace) cards' do
      card1 = Card.new('5♥')
      card2 = Card.new('Queen♥')
      expect(Card.adjust_for_aces(15,[card1,card2])).to eq 15
    end

    context 'when ace low is better' do
      it 'returns a score below 21' do
        card1 = Card.new('Queen♥')
        card2 = Card.new('King♥')
        card3 = Card.new('Ace♥')
        expect(Card.adjust_for_aces(30,[card1,card2,card3])).to eq 21
      end
    end

    context 'when ace high is better' do
      it 'returns a score below 21 but with an 11 value for Aces' do
        card1 = Card.new('5♥')
        card2 = Card.new('Ace♥')
        expect(Card.adjust_for_aces(15,[card1,card2])).to eq 16
      end
    end

    context 'multiple aces' do
      it 'returns the highest score lower than 21 for 3 Aces' do
        card1 = Card.new('Ace♣')
        card2 = Card.new('Ace♦')
        card3 = Card.new('Ace♠')
        expect(Card.adjust_for_aces(30,[card1,card2,card3])).to eq 13
      end

      it 'returns the highest score lower than 21 for 2 Aces' do
        card1 = Card.new('Ace♣')
        card2 = Card.new('Ace♦')
        expect(Card.adjust_for_aces(20,[card1,card2])).to eq 12
      end
    end
  end
end
