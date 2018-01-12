class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :update, :destroy]

  # GET /trips
  def index
    @trips = Trip.all
  end

  # GET /trips/1
  def show
  end

  # POST /trips
  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      render action: 'show', status: :ok
    else
      render action: 'error', status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trips/1
  def update
    if @trip.update(trip_params)
      render action: 'show', status: :ok
    else
      render action: 'error', status: :unprocessable_entity
    end
  end

  # DELETE /trips/1
  def destroy
    @trip.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def trip_params
      params.require(:trip).permit(:info, :status)
    end
end
