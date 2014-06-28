class AddTierToSale < ActiveRecord::Migration
  def change
    add_reference :sales, :tier, index: true
  end
end
