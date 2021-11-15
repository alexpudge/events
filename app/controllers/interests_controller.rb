class InterestsController < ApplicationController
  before_action :current_user_must_be_interest_guest, only: [:edit, :update, :destroy] 

  before_action :set_interest, only: [:show, :edit, :update, :destroy]

  # GET /interests
  def index
    @interests = Interest.page(params[:page]).per(10)
  end

  # GET /interests/1
  def show
  end

  # GET /interests/new
  def new
    @interest = Interest.new
  end

  # GET /interests/1/edit
  def edit
  end

  # POST /interests
  def create
    @interest = Interest.new(interest_params)

    if @interest.save
      message = 'Interest was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @interest, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /interests/1
  def update
    if @interest.update(interest_params)
      redirect_to @interest, notice: 'Interest was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /interests/1
  def destroy
    @interest.destroy
    message = "Interest was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to interests_url, notice: message
    end
  end


  private

  def current_user_must_be_interest_guest
    set_interest
    unless current_user == @interest.guest
      redirect_back fallback_location: root_path, alert: "You are not authorized for that."
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_interest
      @interest = Interest.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def interest_params
      params.require(:interest).permit(:user_id, :event_id, :response)
    end
end
