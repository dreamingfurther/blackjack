require 'spec_helper'

describe 'Features' do
  it 'deals cards to the player and dealer' do
    expect(`ruby blackjack.rb`).to include 'Welcome to Blackjack!'
    expect(`ruby blackjack.rb`).to include 'Player was dealt'
    expect(`ruby blackjack.rb`).to include 'Dealer was dealt'
  end
end
