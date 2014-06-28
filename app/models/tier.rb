class Tier < ActiveRecord::Base
  # has_many :memberships, :dependent => :destroy, :foreign_key => :tier_id
  # has_many :users, through: :memberships
  has_many :users
  
  has_many :sales
  validates_numericality_of :price,
    greater_than: 49,
    message: "must be at least 50 cents"

end
