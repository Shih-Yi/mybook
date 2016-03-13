class CommentsController < ApplicationController
  def creat
    @event = Event.find(params[:post_id])
    @commit = @event.comments.create([:comment].permit(:name,:body))

    redirect_to event_path(@event)
  end
end
