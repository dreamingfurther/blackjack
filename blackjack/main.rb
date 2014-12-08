class Main
  def run
    deal_opening_hands
    show_opening_hands
    play
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
    $stdout.puts "Welcome to Blackjack!\n" +
      "#{player.current}\n" +
      "Player Score: #{player.score}\n\n" +
      "#{dealer.current}\n" +
      "Dealer Score: #{dealer.score}\n\n"
  end

  def play
    input = prompt
    while(player.score <= 21) do
      input ||= prompt
      if 'h'.casecmp(input) == 0
        player.cards << deck.deal
        $stdout.puts player.last_dealt
        $stdout.puts "Player Score: #{player.score}\n"
        input = nil
      elsif 's'.casecmp(input) == 0
        play_the_dealer
        break
      else
        $stdout.puts 'invalid input, please Hit or Stand?(h/s):'
        input = prompt
      end
    end
  end

  def play_the_dealer
    while(dealer.score <= 17) do
      dealer.cards << deck.deal
      $stdout.puts dealer.last_dealt
      $stdout.puts "Dealer Score: #{dealer.score}\n"
    end
  end

  def show_game_status
    if player.score > 21
      $stdout.puts "Bust! You lose..."
    elsif player.score > dealer.score
      $stdout.puts "Player Wins!"
    elsif dealer.score > 21
      $stdout.puts "Bust! You Win!"
    elsif player.score < dealer.score
      $stdout.puts "Dealer Wins"
    end
  end

  def prompt
    puts "Hit or Stand?(h/s):"
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
