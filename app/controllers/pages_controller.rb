class PagesController < ApplicationController
  before_filter :allow_iframe_requests, only: [:header_iframe]
  
  def index
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
  
  
  
  
  def allow_iframe_requests
    response.headers.delete('X-Frame-Options')
  end
end
