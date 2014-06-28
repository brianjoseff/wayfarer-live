class AddEmailsToTier < ActiveRecord::Migration
  def change
    add_column :tiers, :emails, :text
  end
end
