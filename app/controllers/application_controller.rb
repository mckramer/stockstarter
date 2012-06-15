class ApplicationController < ActionController::Base
  protect_from_forgery
  
  #before_filter :require_login, :except => [:not_authenticated]
  
  protected
  
  def not_authenticated
    flash[:notice] = "Please login first."
    redirect_to root_path
  end
  
end
