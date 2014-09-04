class ServiceController < ApplicationController
  
  def index
    @reward = nil
  end

  def rewards_responder

    @portfolio, @reward = nil, nil

    if params.has_key?(:account_id) && params.has_key?(:id)
      @portfolio = Portfolio.find params[:id]
      @reward = Reward.new ChannelSubscription.where(portfolio_id: @portfolio.id)
    end

  	respond_to do |format|
      if @reward
  	    format.html{ render :index  } 
        format.json{ render :json => @reward.as_json , layout: false}
      else
        format.html{ redirect_to index_path }
      end
  	end
  end

end
