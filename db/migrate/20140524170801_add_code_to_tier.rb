class AddCodeToTier < ActiveRecord::Migration
  def change
    add_column :tiers, :code, :string
  end
end
