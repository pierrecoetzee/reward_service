require 'spec_helper'
require File.join(File.dirname(__FILE__), "../../lib/reward")

describe 'EligibilityService' do 
	
	describe 'the service has defined outputs' do

		fixtures :all

		describe 'the eligibility service outputs to the rewards service' do

		  let(:account){
			  accounts(:account2)
		  }

			before(:each){
			  @service = mock('EligibilityService')
			  @service.stub(:outputs).and_return( eligibility_service_output )
			  @service.stub(:new).with(account.id)
			  @service.outputs.should eq( eligibility_service_output )
			  @service.stub(:account_id).and_return account.id
			}

			it 'should respond with customer is eligible' do

				account.portfolio.channel_subscriptions.update_all({channel: 0})

	      @service.stub(:channel_subscriptions).and_return( 
	      	account.portfolio.channel_subscriptions 
	      )

			  @service.stub(:eligible?).and_return( 
			  	check_eligibility_agains_channels
			  )

			  @service.account_id.should eq( account.id )
			  @service.account_id.should eq(account.id)
			  @service.eligible?.should == 'Customer is eligible'

			end

			it 'should respond with Customer is not eligible' do

        account.portfolio.channel_subscriptions.update_all({channel: 1})

				@service.stub(:channel_subscriptions).and_return(
 			    account.portfolio.channel_subscriptions 
				)

			  @service.stub(:eligible?).and_return(
			  	   check_eligibility_agains_channels
			  )

			  @service.eligible?.should == 'Customer is not eligible'

			end	

			it 'should return a technical failure message correctly' do

				@service.stub(:channel_subscriptions).and_return(
 			      account.portfolio.channel_subscriptions 
				)

			  @service.stub(:eligible?).and_raise(StandardError.new( failure_exception_message ))

			  expect{@service.eligible?}.to raise_error(StandardError, 'Service technical failure')
			  
			end		
		end	

		describe 'passing an invalid account number to the service' do

			let(:account){
				nil
			}

			it 'should return the supplied account number is invalid' do
				
				@service = mock('EligibilityService')

				@service.stub(:new).with(8908).and_return{|i|
					Account.find(i)
				}

				@service.stub(:eligible?).and_return(
			  	   check_eligibility_agains_channels
			   )

				@service.eligible?.should == 'The supplied account number is invalid'
				
			end	
		end

	end

	private

	def failure_exception_message
		eligibility_service_output[:technical_failure] 
	end

	def check_eligibility_agains_channels
    
    return eligibility_service_output[:invalid_account_number] if account.nil?
    return eligibility_service_output[:customer_ineligible] if @service.channel_subscriptions.empty?
    	
	  if @service.channel_subscriptions.collect(&:channel).select{|i| Reward::CHANNELS.values[i].eql?("N/A") }.any?
	  	return eligibility_service_output[:customer_ineligible] 
	  end 	
	 
	  eligibility_service_output[:customer_eligible] 

	end

	def eligibility_service_output
		{
		 :customer_eligible=>"Customer is eligible", 
		 :customer_ineligible=>"Customer is not eligible", 
		 :technical_failure=>"Service technical failure", 
		 :invalid_account_number=>"The supplied account number is invalid"}
	end

end