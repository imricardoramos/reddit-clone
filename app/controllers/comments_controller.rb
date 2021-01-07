class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    comment_params = params.require(:comment).permit(:content)
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]
    if @comment.save
      redirect_to community_post_path(params[:community_id], params[:post_id])
    else
      render :new
    end
  end
end
