class Player < Hand
  def current
    cards.each_with_index.map do |card,index|
      "#{index+1}. Player was dealt #{card.value}"
    end.join("\n")
  end

  def last_dealt
    "#{cards.count}. Player was dealt #{cards.last.value}\n"
  end

  def score
    Card.adjust_aces(raw_score, cards)
  end

  private

  def raw_score
    cards.inject(0) {|total, card| total+= card.score; total}
  end
end
