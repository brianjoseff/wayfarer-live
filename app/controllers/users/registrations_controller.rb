class Users::RegistrationsController < Devise::RegistrationsController
  
  # def new
  #   
  #   @tier = Tier.find_by!( params[:tier_id] )
  #   flash[:the_tier_id] = params[:tier_id]
  #   super
  # end
#  before_filter :update_sanitized_params

 
  def new_nonks
    @tier = Tier.find(params[:tier_id])
    if params[:error]
      @error = params[:error]
    end
    flash[:the_tier_id] = params[:tier_id]
    build_resource({})
    respond_with self.resource
  end
  
  
  def create_nonks
    build_resource(sign_up_params)
    @tier = Tier.where(:id => flash[:the_tier_id]).first
    resource.tier_id = @tier.id
    @amount = @tier.price
    resource_saved = resource.save
    token = params[:stripeToken]
    
    begin
      Stripe::Charge.create(:amount => @amount, :currency => "usd", card: token, :description => resource.email)
    rescue Stripe::CardError => e
    
      # The card has been declined or
      # some other error has occurred
      body = e.json_body
      err  = body[:error]

      @error = err[:message]
      @error3 = "what's up"
      redirect_to new_nonks_path(:tier_id => @tier.id, :error => @error)
      return
    
    else   
      
      
    
      yield resource if block_given?
      if resource_saved
        # flash[:success] = "Welcome. You are now a #{@tier.name}"
        if resource.active_for_authentication?
          set_flash_message :notice, :signed_up if is_flashing_format?
          sign_up(resource_name, resource)
          respond_with resource, location: after_sign_up_path_for(resource)
        else
          @error2 = "Dammit"    
          set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
          expire_data_after_sign_in!
          respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end
      else
        # if params[:code] != @tier.code
        #   flash.now[:wrong_code] = "Wrong code"
        # end
        @error2 = resource.email + "fuck"
        clean_up_passwords resource
        respond_with resource
      end
    end
  end
  
  
  
  def create

    build_resource(sign_up_params)
    if @tier = Tier.where(:id => flash[:the_tier_id]).first

      resource.tier_id = @tier.id

    else
      sorting_hat = sorting_hat_into_ks_tier(resource)
      
      if sorting_hat == false
        # change this to prompting them to buy from our pricing page for exclusive access!!!!!!!!!
        flash[:wrong_code] = "Either you didn't sign up with KS or you didn't contribute enough to qualify for one of the levels ($15 is the base level)"
        clean_up_passwords resource
        redirect_to access_levels_path
        return
     
      else
        resource.tier_id = sorting_hat.id
      end
    end
    resource_saved = resource.save
    

    
    yield resource if block_given?
    if resource_saved
      # flash[:success] = "Welcome. You are now a #{@tier.name}"
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else    
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      # if params[:code] != @tier.code
      #   flash.now[:wrong_code] = "Wrong code"
      # end
      clean_up_passwords resource
      respond_with resource
    end
  end
  
  
  private
  def tier_params
     params.require(:tier).permit(:user_ids)
  end
   
  def update_sanitized_params
      devise_parameter_sanitizer.for(:sign_up)
   end
  
  def authenticate_scope!
    send(:"authenticate_#{resource_name}!", force: true)
    self.resource = send(:"current_#{resource_name}")
  end

  def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up)
  end
  

  
  def sorting_hat_into_ks_tier(resource)
    tier1 = Tier.find(1)
    if tier1
      scan1 = tier1.emails.scan(resource.email)
    end
    tier2 = Tier.find(2)
    if tier2.emails
      scan2 = tier2.emails.scan(resource.email)
    end
    tier3 = Tier.find(3)
    if tier3.emails
      scan3 = tier3.emails.scan(resource.email)
    end
    tier4 = Tier.find(4)
    if tier4.emails
      scan4 = tier4.emails.scan(resource.email)
    end
    tier5 = Tier.find(5)
    if tier5.emails
      scan5 = tier5.emails.scan(resource.email)
    end
    tier6 = Tier.find(6)
    if tier6.emails
      scan6 = tier6.emails.scan(resource.email)
    end

    
    if scan1 && scan1.first == resource.email
      return tier1
    elsif scan2 && scan2.first == resource.email
      return tier2
    elsif scan3 && scan3.first == resource.email
      return tier3
    elsif scan4 && scan4.first == resource.email
      return tier4
    elsif scan5 && scan5.first == resource.email
      return tier5
    elsif scan6 && scan6.first == resource.email
      return tier6
    else
      return false
    end
  end
  
  
  
end