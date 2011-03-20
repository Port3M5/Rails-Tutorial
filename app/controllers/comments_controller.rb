class CommentsController < ApplicationController

  def create
    @post = Post.find params[:post_id]
    @comment = @post.comments.create params[:comment]
    respond_to do |format|
      format.html { redirect_to post_path(@post, :anchor => @comment.id) }
      format.js
    end
  end

  def destroy
    @post = Post.find params[:post_id]
    @comment = Comment.find params[:id]
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to post_path @post }
      format.js
    end
  end
end
