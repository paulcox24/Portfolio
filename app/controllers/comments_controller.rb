class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.save
    redirect_to @post
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end 

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id]) 
    if @comment.update_attributes(comment_params)
      redirect_to post_path(@post)
    else
      render action: :edit
    end   
  end 

  def destroy
    @post = Post.find(params[:post_id])
    @comment  = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(id: @post.id)
  end

  private
  
  def comment_params
      params.require(:comment).permit(:post_id, :body)
  end

end