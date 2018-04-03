class PassengersController < ApplicationController

  def index
    @passengers = Passenger.all.paginate(page:params[:page], per_page:15)
  end

  def new
    @passenger = Passenger.new
  end

  def create
    passenger = Passenger.new(passenger_params)
    if passenger.save
      redirect_to passengers_path
    end
  end

  def show
    @passenger = Passenger.find(params[:id])
  end

  def edit
    @passenger = Passenger.find(params[:id])
  end

  def update
    passenger = Passenger.dind(params[:id])
    passenger.assign_attributes(passenger_params)
    if passenger.save
      redirect_to passenger_path(passenger)
    end
  end

  def destroy
    Passenger.destroy(params[:id])
  end

  private
  def passenger_params
    return params.require(:name, :phone_num)
  end

end
