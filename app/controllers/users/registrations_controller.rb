class Users::RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)
    @tier = Tier.find(params[:user][:tier_id])
    #params[:tier][:user_ids] = (params[:tier][:user_ids] << @tier.user_ids).flatten
    if params[:code]
      if params[:code] == @tier.code
        resource.tier_id = @tier.id
      else
        flash[:wrong_code] = "Wrong code"
        clean_up_passwords resource
        redirect_to new_user_registration_path
        return
      end
    end
    resource_saved = resource.save
    yield resource if block_given?
    if resource_saved && 
      flash[:success] = "Welcome. You are now a #{@tier.name}"
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
      if params[:code] != @tier.code
        flash.now[:wrong_code] = "Wrong code"
      end
      clean_up_passwords resource
      respond_with resource
    end
  end
  
  
  private
  def tier_params
     params.require(:tier).permit(:user_ids)
  end
   
  def authenticate_scope!
    send(:"authenticate_#{resource_name}!", force: true)
    self.resource = send(:"current_#{resource_name}")
  end

  def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up)
  end
  
end