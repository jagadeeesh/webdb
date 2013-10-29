class PostsController < ApplicationController
include SessionsHelper
#respond_to :json

def new
  @post=Post.new
end

def show
  @post = Post.find(params[:id])
  #respond_with(@post)
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
  params.require(:post).permit(:title, :content)
end
end
