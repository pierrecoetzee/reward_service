require 'spec_helper'

describe 'routes' do 

	fixtures :all

	describe 'hitting the service from another system' do

		it 'should hit the corect route on an external call' do
			
			account = accounts(:account1)

			expect( get: "/rewards/account/#{account.id}/portfolio/#{account.portfolio.id}.json").to route_to(
						"format"=>"json",
				        "controller"=>"service",
				        "action"=>"rewards_responder",
				        "account_id"=>"303742481",
				        "id"=>"550044371"
			)

		end

		it 'should hit the index' do
			expect( get: '/').to route_to(
				"controller" => "service",
				"action" => "index"
			)
		end

		it 'should get rewards when posting the form ' do
			expect( get: '/eligible_rewards').to route_to(
				"action"=>"rewards_responder", 
				"controller"=>"service"
			)
		end
	end
	
end