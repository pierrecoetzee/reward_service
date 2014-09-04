require 'spec_helper'

describe ChannelSubscription do
  	
    fixtures :all

   	it 'should belong to a portfolio' do
		channel_subscription = channel_subscriptions(:channel_subscription1)
		channel_subscription.respond_to?(:portfolio).should be_truthy
	end
end
