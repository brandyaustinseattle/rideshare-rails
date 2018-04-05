class DriversController < ApplicationController

  def index
    @drivers = Driver.all.paginate(page:params[:page], per_page:15).order('name')
  end

  def new
    @driver = Driver.new

  end

  def create
    @driver = Driver.new(driver_params)

    if @driver.save
      redirect_to drivers_path
    else
      render :new
    end
  end

  def edit
    @driver = Driver.find(params[:id])

  end

  def update
    @driver = Driver.find(params[:id])

    driver.assign_attributes(driver_params)

    if @result.save
      redirect_to driver_path(driver)
    else
      render :edit
    end

  end

  def show
    @driver = Driver.find(params[:id])
  end

  def destroy

    driver = Driver.find(params[:id])
    driver.destroy
    redirect_to drivers_path
  end

  private
  def driver_params
    return params.require(:driver).permit(:name,:vin)
  end

end
