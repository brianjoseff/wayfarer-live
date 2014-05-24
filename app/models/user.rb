class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
         
  # has_many :tiers, :through => :memberships, :foreign_key => :user_id
  # has_many :memberships, :dependent => :destroy, :foreign_key => :user_id
  belongs_to :tier
end
