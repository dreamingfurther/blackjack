class Main

  BUST_SCORE = 21
  DEALER_THRESHOLD = 17

  def run
    deal_opening_hands
    show_opening_hands
    play
    show_game_status
  end

  private

  attr_accessor :player, :dealer, :input

  def play
    while(player.score <= BUST_SCORE) do
      @input = prompt
      if hit
        play_the_player
      elsif stand
        play_the_dealer
        break
      else
        $stdout.puts 'invalid input:'
      end
    end
  end

  def hit
    'h'.casecmp(input) == 0
  end

  def stand
    's'.casecmp(input) == 0
  end

  def play_the_player
    player.cards << deck.deal
    $stdout.puts player.last_dealt
    $stdout.puts "Player Score: #{player.score}\n"
    @input = nil
  end

  def play_the_dealer
    while(dealer.score <= DEALER_THRESHOLD) do
      dealer.cards << deck.deal
      $stdout.puts dealer.last_dealt
      $stdout.puts "Dealer Score: #{dealer.score}\n"
    end
  end

  def prompt
    $stdout.puts "Hit or Stand?(h/s):"
    $stdin.gets.chomp
  end

  def deal_opening_hands
    deck.shuffle
    player.cards << deck.deal
    player.cards << deck.deal
    dealer.cards << deck.deal
    dealer.cards << deck.deal
  end

  def show_opening_hands
    $stdout.puts "Welcome to Blackjack!\n"
    $stdout.puts "#{player.current}\n"
    $stdout.puts "Player Score: #{player.score}\n\n"
    $stdout.puts "#{dealer.current}\n"
    $stdout.puts "Dealer Score: #{dealer.score}\n\n"
  end

  def show_game_status
    if player.score > BUST_SCORE
      $stdout.puts "Bust! You lose..."
    elsif player.score > dealer.score
      $stdout.puts "Player Wins!"
    elsif dealer.score > BUST_SCORE
      $stdout.puts "Bust! You Win!"
    elsif player.score < dealer.score
      $stdout.puts "Dealer Wins"
    end
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
