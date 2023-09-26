require 'rspec'
require './lib/auction'


RSpec.describe Auction do
  before(:each) do
    @auction = Auction.new
  end

  it 'exists' do 
    expect(@auction).to be_an_instance_of(Auction)
  end

   it 'has attributes' do 
    expect(@auction.items).to eq([])
   end

   it 'can add items to the array' do
    @auction.add_item(@item1)
    @auction.add_item(@item2)

    expect(@auction.items).to eq([@item1,@item2])
   end
end