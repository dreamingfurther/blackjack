class Dealer < Hand
  def current
    cards.map { |card| "Dealer was dealt #{card.value}" }.join("\n")
  end
end
