class CommentsController < ApplicationController
  def creat
    @event = Event.find(event_params)
    @commit = @event.comments.create([:comment].permit(:name,:body))

    redirect_to event_path(@event)
  end
  private

  def event_params
    params.require(:comment).permit(:name,:body)
  end


end
