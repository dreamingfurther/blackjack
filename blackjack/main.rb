class Main
  def run
    deal_opening_hands
    show_opening_hands
    take_player_input
    show_game_status
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

  def take_player_input
    input = prompt
    while(player.score < 21) do
      input ||= prompt
      if input == 'h'
        player.cards << deck.deal
        $stdout.puts player.last_dealt
        input = nil
      elsif input == 's'
        break
      end
    end
  end

  def show_game_status
    $stdout.puts "Bust! You lose..." if player.score > 21
  end

  def prompt
    puts "\nHit or Stand?(h/s):"
    $stdin.gets.chomp
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
