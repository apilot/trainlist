class CarsController < ApplicationController
  before_action :set_car, only: %i[show edit update destroy]
  def index
    @cars = Car.all
    @car_cargo = @cars.cargo
    @car_passenger = @cars.passenger
  end

  def show
  end

  def new
    @car = Car.new
  end

  def edit
  end

  def create
    @car = Car.new(car_params)
    respond_to do |format|
      if @car.save
        format.html { redirect_to cars_path, notice: t("general.sucsessfully_create_msg") }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to cars_path, notice: t("general.successfully_update_msg") }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to car_path, notice: t("general.success_destroy: #{@car.number}") }
    end
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:number, :type_of)
  end
end
