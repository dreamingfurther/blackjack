class Card
  def initialize(value)
    @value = value
  end

  def text
    value.chop
  end

  def score
    face_card ? 10 : value.chop.to_i
  end

  def self.adjust_aces(score, cards)
    cards.each do |card|
      if card.value.chop == 'Ace'
        if score >= 21
          score -= 9
        else
          score += 1
        end
      end
    end
    score
  end

  attr_reader :value

  private

  def face_card
    value.length > 2
  end
end
