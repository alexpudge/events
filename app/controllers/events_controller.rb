class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  def index
    @events = Event.all
    @location_hash = Gmaps4rails.build_markers(@events.where.not(:address_latitude => nil)) do |event, marker|
      marker.lat event.address_latitude
      marker.lng event.address_longitude
      marker.infowindow "<h5><a href='/events/#{event.id}'>#{event.start_date}</a></h5><small>#{event.address_formatted_address}</small>"
    end
  end

  # GET /events/1
  def show
    @interest = Interest.new
    @comment = Comment.new
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  def create
    @event = Event.new(event_params)

    if @event.save
      message = 'Event was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @event, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
    message = "Event was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to events_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_params
      params.require(:event).permit(:start_date, :start_time, :end_date, :end_time, :address, :details, :photo, :status, :user_id)
    end
end
