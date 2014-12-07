require 'spec_helper'

describe Main do
  it "runs" do
    expect(Main.new.run).to eq 'Welcome to Blackjack!'
  end
end
