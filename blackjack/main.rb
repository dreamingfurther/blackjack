class Main
  def run
    deal_opening_hands
    "Welcome to Blackjack!\n" + player.current + "\n" + dealer.current
  end

  private

  attr_accessor :player, :dealer

  def deal_opening_hands
    deck.shuffle
    player.cards << deck.deal
    player.cards << deck.deal
    dealer.cards << deck.deal
    dealer.cards << deck.deal
  end

  def deck
    @deck ||= Deck.new
  end

  def player
    @player ||= Player.new
  end

  def dealer
    @dealer ||= Dealer.new
  end
end
