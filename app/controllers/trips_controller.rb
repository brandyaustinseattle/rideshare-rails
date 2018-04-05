class TripsController < ApplicationController

  def index
    if params[:passenger_id]
      passenger = Passenger.find_by(id: passenger_id)
      @trips = passenger.trips
    else
      @trips = Trip.all.paginate(:page => params[:page], per_page:15).order('name')
    end
  end

  def new
    @trip = Trip.new
  end

  def create

    @trip = Trip.create(
      {
        driver_id: Driver.all.sample,
        passenger_id: params[passenger_id],
        date: Date.today,
        rating: nil,
        cost: rand(1..500).to_f
      }
    )

    if @trip.save
      redirect_to trips_path
    else
      render :new
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
    return params.require(:trip).permit(:id, :driver_id, :passenger_id, :date, :rating, :cost)
  end


end
