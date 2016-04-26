class ReviewsController < ApplicationController

  before_action :set_event

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.event = @event
    @review.save
    redirect_to event_path(@event)
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
