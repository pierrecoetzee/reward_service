require 'spec_helper'

describe ServiceController do

  describe "GET 'index'" do

  	fixtures :all

    it "returns http success" do
      get 'index', {format: :html}
      response.should be_success
    end

    it 'should handle an incorrect call  with no form data' do

      get 'rewards_responder', {format: 'html'}
      response.should redirect_to(index_path)
      
    end

    it 'should respond with valid json from a valid account portfolio' do
    	
    	portfolio = portfolios(:portfolio1)
    	account_id = portfolio.account_id

    	get 'rewards_responder', {account_id: account_id, id: portfolio.id , format: :json}
    	response.should be_success
    	assigns(:reward).should be_an_instance_of(Reward)

    	JSON.parse(response.body).should == ["CHAMPIONS_LEAGUE_FINAL_TICKET", "N/A"]

    end
  end

end
