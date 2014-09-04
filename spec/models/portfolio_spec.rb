require 'spec_helper'

describe Portfolio do
	
    fixtures :all

   	it 'should have many channel_subscriptions' do
		portfolio = portfolios(:portfolio1)
		portfolio.respond_to?(:channel_subscriptions).should be_truthy
	end
end
