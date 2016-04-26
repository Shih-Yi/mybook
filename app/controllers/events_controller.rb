class EventsController < ApplicationController

  before_action :set_event, :only => [ :show, :edit, :update, :destroy]


  def index
    @event = Event.new
    @events = Event.page(params[:page]).per(5)

  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "Book was successfully created"
      redirect_to events_path
    else
      render :action => :new
    end
  end

  def show
    @page_title = @event.bookname
    @reviews = Review.where(event_id: @event)
    if @reviews.blank?
      @avg_rating = 0
    else
      @avg_rating = @reviews.average(:rating).round(2)
    end
  end

  def edit

    @events = Event.page(params[:page]).per(5)
    render :index
  end

  def update
    if @event.update(event_params)
      flash[:notice] = "Book was successfully updated"
      redirect_to event_path(@event)
    else
      render :action => :edit
    end
  end

  def destroy
    @event.destroy
    flash[:alert] = "Book was successfully deleted"
    redirect_to events_path
  end

  def search
    @search_q = params[:q]
    # @events = Event.search @search_q
    @events = Event.where(:bookname => @search_q)

    respond_with @events
  end


  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:bookname,:author,:description)
  end


end
