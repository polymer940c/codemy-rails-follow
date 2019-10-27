class CommentsController < ApplicationController
  def create
    @post = Post.where(id: params[:post_id]).first
    @comment = @post.comments.new(comment_params)

    if @comment.save
      redirect_to post_path(@post)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
