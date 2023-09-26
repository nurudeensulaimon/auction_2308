require 'rspec'
require './lib/item'
require './lib/auction'
require './lib/attendee'
require 'pry'

RSpec.describe Item do 
  before(:each) do 
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    @item4 = Item.new('2 Days Dogsitting')
    @item5 = Item.new('Forever Stamps')

    @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
  end
   
   it 'exists' do
    expect(@item1).to be_a_instance_of(Item)
    expect(@item2).to be_a_instance_of(Item)
    expect(@item3).to be_a_instance_of(Item)
    expect(@item4).to be_a_instance_of(Item)
    expect(@item5).to be_a_instance_of(Item)
    
    expect(@attendee1).to be_an_instance_of(Attendee)
    expect(@attendee2).to be_an_instance_of(Attendee)
    expect(@attendee3).to be_an_instance_of(Attendee)
   end

   it 'has attributes' do 
    expect(@item1.name).to eq("Chalkware Piggy Bank")
    expect(@item2.name).to eq('Bamboo Picture Frame')
    expect(@item3.name).to eq('Homemade Chocolate Chip Cookies')
    expect(@item4.name).to eq('2 Days Dogsitting')
    expect(@item5.name).to eq('Forever Stamps')
   end

   it 'has a method add_bids'   do 
    expect(@item1.bids).to eq({})

    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)

    expected_hash = {@attendee2 => 20,
      @attendee1 => 22}
    expect(@item1.bids).to eq(expected_hash)
   end

   it 'has a method current_high_bid' do
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)

    expect(@item1.current_high_bid).to eq(22)
  end 
end