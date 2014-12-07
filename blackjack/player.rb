class Player < Hand
  def current
    cards.map { |card| "Player was dealt #{card.value}" }.join("\n")
  end
end
