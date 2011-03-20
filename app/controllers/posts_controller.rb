class PostsController < ApplicationController

  def index
    @posts = Post.all
    respond_to do |format|
      format.html
      format.json { render :json => @posts }
      format.xml { render :xml => @posts }
    end
  end

  def show
    @post = Post.find params[:id]
  end

  def new
   @post = Post.new 
  end

  def create
    @post = Post.new params[:post]
    if @post.save
      redirect_to posts_url, :notice => "Post created Successfully."
    else
      render :action => 'new'
    end
  end
end
