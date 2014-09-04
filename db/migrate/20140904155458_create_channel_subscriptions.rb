class CreateChannelSubscriptions < ActiveRecord::Migration
  def change
    create_table :channel_subscriptions do |t|

      t.integer :portfolio_id
      t.integer :channel
      t.timestamps
    end
  end
end
