class PostsController < ApplicationController
include SessionsHelper
before_action :signed_in_user, only: [:show, :new ]
#before_action :signed_in_user, except: [:key] 
#respond_to :json

def new
  @post=Post.new
  @key= SecureRandom.hex(16)
end

def show
  @post = Post.find(params[:id])
  #respond_with(@post)
end

def key
  post = Post.where(key: params[:key]).first
  render json: post
end

def id
  str=params[:id]
  fields=str.split('.')
  post = Post.where(id: fields[0])
  title=post.id
  render json: title
end

def create
  @post = current_user.posts.build(post_params)
  if @post.save
    flash[:success]="your data successfuly stored"
    redirect_to @post
  else
    render :new
  end
end

private
def post_params
  params.require(:post).permit(:title, :content, :key)
end
end
