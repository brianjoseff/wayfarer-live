class Tier < ActiveRecord::Base
  # has_many :memberships, :dependent => :destroy, :foreign_key => :tier_id
  # has_many :users, through: :memberships
  has_many :users
  
end
