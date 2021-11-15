class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]

  def index
    @q = Event.ransack(params[:q])
    @events = @q.result(distinct: true).includes(:host, :comments,
                                                 :guests).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@events.where.not(address_latitude: nil)) do |event, marker|
      marker.lat event.address_latitude
      marker.lng event.address_longitude
    end
  end

  def show
    @interest = Interest.new
    @comment = Comment.new
  end

  def new
    @event = Event.new
  end

  def edit; end

  def create
    @event = Event.new(event_params)

    if @event.save
      message = "Event was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @event, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: "Event was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    message = "Event was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to events_url, notice: message
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:start_date, :start_time, :end_date,
                                  :end_time, :address, :details, :photo, :status, :user_id)
  end
end
