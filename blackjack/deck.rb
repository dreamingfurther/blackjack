class Deck
  SUITS = %w(♣ ♦ ♠ ♥)
  NUMBERS = %w(Ace 2 3 4 5 6 7 8 9 10 Jack Queen King)

  def initialize
    @cards = []
    sort
  end

  def deal_to(hand)
    hand.cards << cards.shift
  end

  def shuffle
    @cards = @cards.shuffle
  end

  attr_accessor :cards

  private

  def sort
    SUITS.each do |suit|
      NUMBERS.each do |number|
        cards << Card.new("#{number}#{suit}")
      end
    end
  end
end
