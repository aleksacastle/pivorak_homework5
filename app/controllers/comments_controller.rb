class CommentsController < ApplicationController
  def create
    @comment = event.comments.create!(comment_params)

    redirect_to event
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(user_id: current_user.id)
  end

  def event
    @event ||= Event.find(params[:event_id])
  end
end
