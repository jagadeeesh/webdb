class UsersController < ApplicationController
include SessionsHelper

before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
def new
  @user=User.new()
end

def index
  @user=current_user
  @id=@user.id
  @post=Post.where("user_id=?",@id)
end

def create
  @user=User.new(post_params)
  if @user.save
    flash[:success]="your successfuly signup"
    redirect_to signin_path
  else
    render :new
  end
end

private
def post_params
  params.require(:user).permit(:name, :email, :password)
end
end
