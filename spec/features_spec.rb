require 'spec_helper'

describe 'Features' do
  let(:hit) { %w(h h h h h h h h h h) }

  it 'deals cards to the player and dealer' do
    output = FakeIO.each_input(hit) { Main.new.run }
    expect(output).to include 'Welcome to Blackjack!'
    expect(output).to include '1. Player was dealt'
    expect(output).to include '2. Player was dealt'
    expect(output).to include '1. Dealer was dealt'
    expect(output).to include '2. Dealer was dealt'
  end

  context 'prompting the player for input' do
    it 'accepts input' do
      output = FakeIO.each_input(hit) { Main.new.run }
      expect(output).to include "\nHit or Stand?(h/s):"
    end

    it 'continues prompting on hits until bust' do
      output = FakeIO.each_input(hit) do
        Main.new.run
      end
      expect(output).to include '3. Player was dealt'
      expect(output).to include 'Bust! You lose...'
    end

    it 'does not prompt again on a stand' do
      output = FakeIO.each_input(['s']) do
        Main.new.run
      end
      expect(output).not_to include '3. Player was dealt'
    end

    it 'accepts uppercase' do
      output = FakeIO.each_input(['S']) do
        Main.new.run
      end
      expect(output).not_to include '3. Player was dealt'
    end

    it 'reprompts for invalid input' do
      output = FakeIO.each_input(['invalid'] + hit) do
        Main.new.run
      end
      expect(output).to include 'invalid input, please Hit or Stand?(h/s):'
    end
  end
end
