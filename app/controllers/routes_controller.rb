class RoutesController < ApplicationController
  before_action :set_route, only: %i[show edit update destroy]
  def index
    @routs = Route.all
  end

  def show
  end

  def new
    @route = Route.new
  end

  def edit
  end

  def create
    @route = Route.new(route_params)
    respond_to do |format|
      if @route.save
        format.html { redirect_to routes_path, notice: t("general.sucsessfully_create_msg") }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @route.update(route_params)
        format.html { redirect_to routes_path, notice: t("general.successfully_update_msg") }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @route.destroy
    respond_to do |format|
      format.html { redirect_to route_path, notice: t("general.success_destroy: #{@route.name}") }
    end
  end

  private

  def set_route
    @route = Route.find(params[:id])
  end

  def route_params
    params.require(:route).permit(:name, station_ids: [])
  end
end
