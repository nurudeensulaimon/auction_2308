
class Auction 
  attr_reader :items
  def initialize 
    @items = []
  end

  def add_item(item)
    @items << item
 end

  def unpopular_items
  @items.select do |item|
    item.bids.empty?
  end
 end


 def potential_revenue
  potential_revenue = 0

  @items.each do |item|
    if !item.bids.empty?
      potential_revenue += item.current_high_bid
    end
  end
  potential_revenue
 end


  def bidders
  bidder = []
  @items.each do |item|
    item.bids.each do |attendee, bid_amount|
      bidder << attendee.name
    end
  end
  bidder.uniq
 end

  def bidder_info
  hash_info = {}
  @items.each do |item|
    item.bids.each do |attendee, bids|
      hash_info[attendee] = {
        budget: attendee.budget,
        items:  bid_item(attendee), 
      }
    end
  end
    hash_info
  end

  def bid_item(attendee)
    bid_items = []
    @items.find_all do |item|
      if !item.bids.empty? && item.bids.include?(attendee)
        bid_items << item
      end
    end
    bid_items
  end
end

 