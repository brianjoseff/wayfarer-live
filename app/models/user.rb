class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
         
  # has_many :tiers, :through => :memberships, :foreign_key => :user_id
  # has_many :memberships, :dependent => :destroy, :foreign_key => :user_id
  belongs_to :tier
  
  # after_create :create_a_customer, :charge_customer
  #after_create :create_a_customer

  def create_a_customer
  	token = self.stripe_card_token
	
  	customer = Stripe::Customer.create(
  :card => token,
  :email => self.email)
  Stripe::Charge.create(:amount => Tier.find(self.tier_id).price, :currency => "usd", :customer => customer)
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while charging card: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false   
    # user.stripe_customer_id = customer.id
    # user.save!       	
  end
  

  def charge_customer
    customer_id = Stripe::Customer.retrieve(self.stripe_customer_id)
    Stripe::Charge.create(:amount => Tier.find(self.tier_id).price, :currency => "usd", :customer => customer_id)
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while charging card: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false   
  end
  
  
  def self.sign_team_up(email)
    User.create!(email: email, password: "wayfaring", tier_id: 1)
  end
  
  
  
end
