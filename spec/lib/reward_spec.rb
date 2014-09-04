require 'spec_helper'
require File.join(File.dirname(__FILE__), "../../lib/reward")

describe 'reward class' do 

    fixtures :all

	it 'receives an array of channel subscriptions whe initialised' do
	    subscriptions = ChannelSubscription.all
		reward = Reward.new subscriptions
		reward.instance_variable_get(:@channels).should_not == []
		reward.instance_variable_get(:@channels).should == [0,3,3]
		reward.as_json.should == ["CHAMPIONS_LEAGUE_FINAL_TICKET", "N/A", "N/A"]
	end

	it 'should be able to handle no channels being passed' do
		subscriptions = []
		reward = Reward.new subscriptions
		reward.instance_variable_get(:@channels).should == []
		reward.as_json.should == []
	end
	
end
