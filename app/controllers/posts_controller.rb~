class PostsController < ApplicationController
def new
@post=Post.new
end

def create
@post=Post.new(post_params)
if @post.save
flash[:success]="your data successfuly stored"
redirect_to :back
else
render :new
end
end

private
def post_params
params.require(:post).permit(:title, :content)
end
end
