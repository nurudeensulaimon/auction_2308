class Item 
  attr_reader :name,
              :bids 
  def initialize(name)
    @name = name
    @bids = {}
  end

  def add_bid(attendee, bid_amount)
    bids[attendee] = bid_amount
   # binding.pry
  end

  def current_high_bid
    @bids.values.max
  end
end