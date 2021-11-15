class InterestsController < ApplicationController
  before_action :current_user_must_be_interest_guest,
                only: %i[edit update destroy]

  before_action :set_interest, only: %i[show edit update destroy]

  def index
    @q = Interest.ransack(params[:q])
    @interests = @q.result(distinct: true).includes(:guest,
                                                    :event).page(params[:page]).per(10)
  end

  def show; end

  def new
    @interest = Interest.new
  end

  def edit; end

  def create
    @interest = Interest.new(interest_params)

    if @interest.save
      message = "Interest was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @interest, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @interest.update(interest_params)
      redirect_to @interest, notice: "Interest was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @interest.destroy
    message = "Interest was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to interests_url, notice: message
    end
  end

  private

  def current_user_must_be_interest_guest
    set_interest
    unless current_user == @interest.guest
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_interest
    @interest = Interest.find(params[:id])
  end

  def interest_params
    params.require(:interest).permit(:user_id, :event_id, :response)
  end
end
