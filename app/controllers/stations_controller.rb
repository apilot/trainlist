class StationsController < ApplicationController
  before_action :set_station, only: %i[show edit update destroy]
  def index
    @stations = Station.all
  end

  def show
  end

  def new
    @station = Station.new
  end

  def edit
  end

  def create
    @station = Station.new(station_params)
    respond_to do |format|
      if @station.save
        format.html { redirect_to stations_path, notice: t("general.sucsessfully_create_msg") }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @station.update(station_params)
        format.html { redirect_to stations_path, notice: t("general.successfully_update_msg") }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @station.destroy
    respond_to do |format|
      format.html { redirect_to station_path, notice: t("general.success_destroy: #{@station.name}") }
    end
  end

  private

  def set_station
    @station = Station.find(params[:id])
  end

  def station_params
    params.require(:station).permit(:name)
  end
end
