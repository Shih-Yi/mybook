class PostsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @post = @event.posts.create(params[:post].permit(:name, :body))

    redirect_to event_path(@event)
  end



end
