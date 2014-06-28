class TransactionsController < ApplicationController


  skip_before_action :authenticate_user!,
    only: [:new, :create]
  def new
    @tier = Tier.find_by!( params[:tier_id] )
    flash[:the_tier_id] = params[:tier_id]
  end
  
  def pickup
    @sale = Sale.find_by!(guid: params[:guid])
    @tier = @sale.tier
  end
  
  def create
    # tier = Tier.find_by!( permalink: params[:permalink] )
    if @tier = Tier.where(:id => flash[:the_tier_id]).first

      @amount = @tier.price

    else
      @amount = 1000
    end
    token = params[:stripeToken]
  begin
      charge = Stripe::Charge.create(
        amount:      @amount,
        currency:    "usd",
        card:        token,
        description: params[:email]
        )
        @sale = Tier.sales.create!(
          email:      params[:email]
        )
        redirect_to exclusive_content_path
      rescue Stripe::CardError => e
        # The card has been declined or
        # some other error has occurred
        @error = e
        render :new
      end
  end
  
  def download
    @sale = Sale.find_by!(guid: params[:guid])
    resp = HTTParty.get(@sale.Tier.file.url)
    filename = @sale.Tier.file.url
    send_data resp.body,
      :filename => File.basename(filename),
      :content_type => resp.headers['Content-Type']
  end
end
