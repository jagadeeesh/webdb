class SessionsController < ApplicationController
include SessionsHelper
def new
end
def create
   user = User.find_by(email: params[:session][:email].downcase)
  if user && (user.password==(params[:session][:password]))
      flash.now[:success]="your are signin now"
      sign_in user
      redirect_to :users
    
  else
     flash.now[:error] = 'Invalid email/password combination'
     render 'new'
  end
  end
def destroy
    sign_out
    redirect_to root_url
end  
  
end
