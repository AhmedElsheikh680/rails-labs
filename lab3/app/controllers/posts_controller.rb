class PostsController < ApplicationController
  before_action :unauthenticated_user 
  def index
    @posts=User.find(session[:user]).posts
  end

  def new
    @post=Post.new
  end

  def create
    # @post = Post.new(params.require(:post.permit(:title ,:content))
    # @post.user_id=session[:user]
    @post=User.find(session[:user]).posts.create(params.require(:post).permit(:title ,:content))
    return redirect_to root_path , notice: 'post created successful'if @post.persisted?
    render 'posts/new'
  end
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:title ,:content))
      return redirect_to root_path , notice: 'post updated successful'
    else
      render 'posts/edit' , notice: 'failed to update post'
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    return redirect_to root_path , notice: 'post deleted successful'
  end
end
