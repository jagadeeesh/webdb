class PostsController < ApplicationController
include SessionsHelper
before_action :signed_in_user, only: [:show, :new ]

def new
  @post=Post.new
  @key= SecureRandom.hex(16)
end
def edit
  @post=Post.find(params[:id])
  @key= SecureRandom.hex(16)
end
def update
   @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
       flash[:success] = "Post updated"
       redirect_to @post
    else
      render 'edit'
    end
end
def destroy
    Post.find(params[:id]).destroy
    flash.now[:success] = "post deleted."
    redirect_to :back
end

def show
  @post = Post.find(params[:id])
end

def key
  post = Post.find_by_key(params[:id])
  data = JSON.parse(post.content)
  if params[:key].present?
    keys = params[:key].split('.')
    keys.shift
    i=0 
    while i<keys.length do
      data=data[keys[i]]
      i +=1
    end
    render json: data  
  else
    render json: data
  end
end

def url
    
    @post = Post.find(params[:id])
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

