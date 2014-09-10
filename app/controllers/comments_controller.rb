class CommentsController < ApplicationController
  before_action :find_post
  before_action :set_comment, only: [:edit, :update, :destroy]

  def new
    @comment = @post.comments.new
  end

  def create
    @comment = @post.comments.build(comment_params)
    if @comment.save
      redirect_to post_path(@post)
    else
      render :new
    end 
  end

  def edit
  end 

  def update
    if @comment.update(comment_params)
      redirect_to post_path(@post)
    else
      render :edit
    end   
  end 

  def destroy
    @comment.destroy
    redirect_to post_path(@post)
  end

  private
  
  def comment_params
    params.require(:comment).permit(:post_id, :body)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def find_post
    @post = Post.find(params[:post_id])
  end

end