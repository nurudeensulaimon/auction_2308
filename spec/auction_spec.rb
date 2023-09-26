require 'rspec'
require 'pry'
require './lib/auction'
require './lib/attendee'

require './lib/item'

RSpec.describe Auction do
  before(:each) do
    @auction = Auction.new

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
    expect(@auction).to be_an_instance_of(Auction)
  end

   it 'has attributes' do 
    expect(@auction.items).to eq([])
   end

   it 'can add items to the array' do
    @auction.add_item(@item1)
    @auction.add_item(@item2)

   end

   it 'can add more items in the array' do 
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)
   end

  it 'has a method #auction.unpopular_items' do
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)

    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    @item4.add_bid(@attendee3, 50)

    expect(@auction.unpopular_items).to eq([@item2,@item3,@item5])

    @item3.add_bid(@attendee2, 15)

    expect(@auction.unpopular_items).to eq([@item2,@item5])

    end

    it 'returns an integer sum of bids' do

      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)

      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)

      expect(@auction.potential_revenue).to eq(87)
    end

    it 'shows bidders' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)

      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)

      expect(@auction.bidders).to eq(['Bob', 'Megan', 'Mike'])
    end

    it 'shows bidder info' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)

      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)

      expect(@auction.bidder_info).to be_a(Hash)
      expect(@auction.bidder_info.keys.first.class).to eq(Attendee)
      expect(@auction.bidder_info.values.first.class).to eq(Hash)
    end

    xit 'returns a hash with items linked to the attendee with the highest bid' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)

      @item1.add_bid(@attendee1, 18)
      @item1.add_bid(@attendee2, 30)
      @item2.add_bid(@attendee1, 30)
      @item3.add_bid(@attendee2, 5)
      @item3.add_bid(@attendee3, 3)
      @item4.add_bid(@attendee3, 40)
      @item4.add_bid(@attendee1, 55)
      @item4.add_bid(@attendee2, 45)
      
      expected_hash = {
        @item1 => @attendee2,
        @item2 => @attendee1,
        @item3 => @attendee3,
        @item4 => @attendee2,
        @item5 => 'Not Sold'
      }
      
      expect(@auction.close_auction).to eq(expected)
    end
  end
  
  
