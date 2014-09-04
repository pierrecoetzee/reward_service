class ChannelSubscription < ActiveRecord::Base

  attr_accessible :portfolio_id, :channel
  
  belongs_to :portfolio
  
end
