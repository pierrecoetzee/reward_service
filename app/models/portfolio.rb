class Portfolio < ActiveRecord::Base
  
  attr_accessible :account_id

  has_many :channel_subscriptions
  
  belongs_to :account
  
end
