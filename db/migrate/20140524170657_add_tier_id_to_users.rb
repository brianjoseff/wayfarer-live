class AddTierIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :tier_id, :integer
  end
end
