class LocationsController < ApplicationController
  before_action :set_trip, only: [:create]

  # POST /locations
  def create
    @location = @trip.locations.new(location_params)
    if @location.valid?
      TripWorker.perform_async(@location.serializable_hash)

      render action: 'success', status: :ok
    else
      render action: 'error', status: :unprocessable_entity
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_trip
    # @trip = Trip.find(params[:trip_id])
    @trip = Rails.cache.read("trip_#{params[:trip_id]}").nil? ? Trip.find(params[:trip_id]) : Rails.cache.read("trip_#{params[:trip_id]}")
  end

  # Only allow a trusted parameter "white list" through.
  def location_params
    params.require(:location).permit(:latitude, :longitude)
  end
end
