require 'spec_helper'

describe 'Features' do
  it 'deals cards to the player and dealer' do
    output = FakeIO.each_input(["hit"]) { Main.new.run }
    expect(output).to include 'Welcome to Blackjack!'
    expect(output).to include 'Player was dealt'
    expect(output).to include 'Dealer was dealt'
  end

  it 'prompts the player for input' do
    output = FakeIO.each_input(["hit"]) { Main.new.run }
    expect(output).to include "\nHit or Stand?(h/s):"
  end
end
