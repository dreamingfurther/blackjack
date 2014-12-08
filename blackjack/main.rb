class Main
  def run
    deal_opening_hands
    show_opening_hands
    prompt
  end

  private

  attr_accessor :player, :dealer, :input

  def deal_opening_hands
    deck.shuffle
    player.cards << deck.deal
    player.cards << deck.deal
    dealer.cards << deck.deal
    dealer.cards << deck.deal
  end

  def show_opening_hands
    puts "Welcome to Blackjack!\n" +
      player.current + "\n\n" +
      dealer.current + "\n"
  end

  def prompt
    puts "\nHit or Stand?(h/s):"
    input = $stdin.gets
    # $stdout.puts input
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
