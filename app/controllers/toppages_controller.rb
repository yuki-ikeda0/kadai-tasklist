class ToppagesController < ApplicationController
  def index
    if logged_in? 
    redirect_to taskapps_path
    
    end
  end
end
