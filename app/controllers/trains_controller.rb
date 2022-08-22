class TrainsController < ApplicationController
  before_action :set_train, only: %i[show edit update destroy]
  def index
    @trains = Train.all.includes([:route])
    @train_cargo = @trains.cargo
    @train_passenger = @trains.passenger
  end

  def show
    @station = Station.find(@train.station_id) if @train.station_id
    @route = Route.includes([:stations]).find(@train.route.id)
    @all_stations = @route.stations[0..]
  end

  def new
    @train = Train.new
  end

  def edit
    if @train.cargo?
      @cars = Car.cargo.where(status: "free")
    elsif @train.passenger?
      @cars = Car.passenger.where(status: "free")
    end
  end

  def create
    @train = Train.new(train_params)
    respond_to do |format|
      if @train.save
        format.html { redirect_to trains_path, notice: t("general.sucsessfully_create_msg") }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @train.update(train_params)
        format.html { redirect_to trains_path, notice: t("general.successfully_update_msg") }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @train.destroy
    respond_to do |format|
      format.html { redirect_to train_path, notice: t("general.success_destroy: #{@train.name}") }
    end
  end

  private

  def set_train
    @train = Train.find(params[:id])
  end

  def train_params
    params.require(:train).permit(:number, :car_max, :route_id, :station_id, :type_of, car_ids: [])
  end
end
