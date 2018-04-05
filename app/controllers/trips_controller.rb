class TripsController < ApplicationController

  def create

    @trip = Trip.create(
      {
        driver_id: Driver.all.sample.id,
        passenger_id: params[:passenger_id],
        date: Date.today,
        rating: nil,
        cost: rand(1..500).to_f
      }
    )

    if @trip.save
      redirect_to passenger_trip_path(params[:passenger_id], @trip.id)
    else
      # not sure what to put here
      render :new
    end
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def update
    trip = Trip.find(params[:id])
    trip.assign_attributes(trip_params)
    if trip.save
      redirect_to passenger_trip_path(params[:passenger_id], trip.id)
    end
  end

  def destroy
    Trip.destroy(params[:id])

    redirect_to passenger_path(params[:passenger_id])
  end

  private
  def trip_params
    return params.require(:trip).permit(:id, :driver_id, :passenger_id, :date, :rating, :cost)
  end

end
