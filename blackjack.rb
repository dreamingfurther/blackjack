TEST ||= false

require './blackjack/main'
require './blackjack/card'
require './blackjack/deck'

require './blackjack/hand'
require './blackjack/player'
require './blackjack/dealer'

unless TEST
  Main.new.run
end
