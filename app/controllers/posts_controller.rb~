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
      # Handle a successful update.
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
  #respond_with(@post)
end

def key
  post = Post.find_by_key(params[:id])
  data = JSON.parse(post.content)
  if params[:key].present?
    keys = params[:key].split('.')
    render json: data[params[:key]]
  else
    render json: data
  end
end

def create
  #if post_params.content.isJSON()
  @post = current_user.posts.build(post_params)
  if @post.save
    flash[:success]="your data successfuly stored"
    redirect_to @post
  else
    render :new
  end
  #else
   # flash[:success]="not valid json data"
    #redirect_to @post
    #end
end

private
def post_params
  params.require(:post).permit(:title, :content, :key)
end
end

{world: {india: 'sachin'}}
