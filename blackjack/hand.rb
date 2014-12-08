class Hand
  def initialize
    @cards = []
  end

  def score
    Card.adjust_for_aces(raw_score, cards)
  end

  attr_accessor :cards

  private

  def raw_score
    cards.inject(0) {|total, card| total+= card.score; total}
  end
end
