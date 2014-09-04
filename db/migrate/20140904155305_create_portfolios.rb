class CreatePortfolios < ActiveRecord::Migration
	
  def change

    create_table :portfolios do |t|
      t.references :account
      t.timestamps
    end
  end
end
