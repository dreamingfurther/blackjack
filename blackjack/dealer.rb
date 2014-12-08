class Dealer < Hand
  def current
    cards.each_with_index.map do |card,index| 
      "#{index+1}. Dealer was dealt #{card.value}"
    end.join("\n")
  end
end
