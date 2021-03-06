class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
=begin  
   rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "You must first login to view this page"
    session[:user_return_to] = request.url
    redirect_to root_url
=end 

def confirm_logged_in
    unless session[:id]
        flash[:notice] = "Please log in"
        redirect_to :root
        return false
    else
        return true
    end
end                                                                                                                                                       
end
