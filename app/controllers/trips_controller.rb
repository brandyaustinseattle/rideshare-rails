class TripsController < ApplicationController

  def index
    @trips = Trip.all.paginate(:page => params[:page], per_page:15).order('name')
  end

  def new
    @trip = Trip.new
  end

  def create
    trip = Trip.new(trip_params)
    if trip.save
      redirect_to trips_path
    end
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    trip = Trip.find(params[:id])
    trip.assign_attributes(trip_params)
    if trip.save
      redirect_to trip_path(trip)
    end
  end

  def destroy
    Trip.destroy(params[:id])
  end

  private
  def trip_params
    return params.require(:id, :driver_id, :passenger_id, :date, :rating, :cost)
  end

end
