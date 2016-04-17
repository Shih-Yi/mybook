class CommentsController < ApplicationController
  def creat
    @event = Event.find(commnet_params)
    @commit = @event.comments.create([:comment].permit(:name,:body))
    # @commit.user_id = current_user
    # @commit.save
    redirect_to event_path(@event)
  end
  private

  def commnet_params
    params.require(:comment).permit(:name,:body, :suser_id)
  end


end
