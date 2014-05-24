class Membership < ActiveRecord::Base
  # attr_accessible :tier_id, :user_id
  belongs_to :user
  belongs_to :tier
  validates_uniqueness_of :user_id, :scope => :tier_id
end
