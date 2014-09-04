require 'spec_helper'

describe 'coming to the landing page' do 

	fixtures :all

	it 'can present a page to the user to request the rewards' do
		
		visit "/index"
		account = accounts(:account1)

		fill_in "_account_id", with: account.id
		fill_in "_id", with: account.portfolio.id

		click_button 'Check rewards'
		page.should have_content 'CHAMPIONS_LEAGUE_FINAL_TICKET'
		page.should have_content 'N/A'
		page.should have_content 'The customer qualifies for:'
		page.should have_css '.box-results'

	end
end