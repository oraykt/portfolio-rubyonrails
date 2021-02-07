class CommentsController < ApplicationController
  before_action :set_comment, :create
  def create
    @comment = current_user.comments.build(set_comment)
  end

  private

  def set_comment
    params.require(:comment).permit(:content)
  end
end
