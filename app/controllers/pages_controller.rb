class PagesController < ApplicationController
  before_filter :allow_iframe_requests, only: [:header_iframe]
  before_filter :redirect_to_signup, :only => [:exclusive_content]
  
  def index
  end
  
  def episodes
  end
  
  def journals
  end
  
  def polls
  end
  
  def about
  end
  
  def team
  end
  
  def shop
  end
  
  def social_hub
  end
  
  def header_iframe
  end
  
  def sponsors
  end
  
  def contact_us
  end
  
  def exclusive_content
  end
  
  
  
  def allow_iframe_requests
    response.headers.delete('X-Frame-Options')
  end
  
  
  def redirect_to_signup
    
    unless signed_in?
      store_location
      
      redirect_to new_user_registration_path, notice: "Please sign up or in."
    end
  end
  
  def store_location
    session[:user_return_to] = request.url
    #session[:return_to] = root_path
    #setting to root here because it redirects to sign up when the user tries to access /followships
    
  end
  
end
