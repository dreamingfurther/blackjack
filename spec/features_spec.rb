require 'spec_helper'

describe 'Features' do
  let(:hit) { %w(h h h h h h h h h h) }

  def run(player_input)
    FakeIO.each_input(player_input) { Main.new.run }
  end

  it 'deals cards to the player and dealer' do
    output = run(hit)
    expect(output).to include 'Welcome to Blackjack!'
    expect(output).to include '1. Player was dealt'
    expect(output).to include '2. Player was dealt'
    expect(output).to include 'Player Score:'
    expect(output).to include '1. Dealer was dealt'
    expect(output).to include '2. Dealer was dealt'
    expect(output).to include 'Dealer Score:'
  end

  context 'playing the dealer' do
    before do
      class Deck
        def shuffle
        end
      end
    end

    after do
      class Deck
        def shuffle
          @cards = @cards.shuffle
        end
      end
    end

    it 'keeps hitting as the dealer' do
      output = run(['s'])
      expect(output).to include "Dealer Score:"
    end

    context 'player wins' do
      it 'displays bust you win message' do
        output = run(['h','h','h','s'])
        expect(output).to include "Bust! You Win!"
      end
    end

    context 'dealer wins' do
      it 'displays dealer wins message' do
        output = run(['h','s'])
        expect(output).to include "Dealer Wins"
      end
    end
  end

  context 'prompting the player for input' do
    it 'accepts input' do
      output = run(hit)
      expect(output).to include "\nHit or Stand?(h/s):"
    end

    it 'continues prompting on hits until bust' do
      output = run(hit)
      expect(output).to include '3. Player was dealt'
      expect(output).to include 'Bust! You lose...'
    end

    it 'does not prompt again on a stand' do
      output = run(['s'])
      expect(output).not_to include '3. Player was dealt'
    end

    it 'accepts uppercase' do
      output = run(['S'])
      expect(output).not_to include '3. Player was dealt'
    end

    it 'reprompts for invalid input' do
      output = run(['invalid'] + hit)
      expect(output).to include 'invalid input:'
    end
  end
end
