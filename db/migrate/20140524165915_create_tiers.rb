class CreateTiers < ActiveRecord::Migration
  def change
    create_table :tiers do |t|
      t.string :name
      t.text :description
      t.integer :price

      t.timestamps
    end
  end
end
