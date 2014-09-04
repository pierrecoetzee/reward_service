RewardService::Application.routes.draw do

  match "index" => "service#index"

  #exposed call for any other application - receiving back a json object of rewards
  match "rewards/account/:account_id/portfolio/:id" => "service#rewards_responder" , :defaults=>{format: :json}

  #application level service to return results on page
  match "eligible_rewards" => "service#rewards_responder", as: 'eligible_rewards'

  root :to => 'service#index'

end
