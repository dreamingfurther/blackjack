require 'spec_helper'

describe Card do
  it 'sets the value of the Card' do
    expect(Card.new('10♣').value).to eq '10♣'
  end
end
