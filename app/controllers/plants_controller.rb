class PlantsController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :render_no_plant

  # GET /plants
  def index
    plants = Plant.all
    render json: plants
  end

  # GET /plants/:id
  def show
    plant = find_plant
    render json: plant
  end

  # POST /plants
  def create
    plant = Plant.create(plant_params)
    render json: plant, status: :created
  end

  def update
    plant = find_plant
    plant.update(plant_params)
    render json: plant, status: :created
  end

  def destroy
    plant = find_plant
    plant.destroy
    render json: {}
  end

  private

  def plant_params
    params.permit(:name, :image, :price, :is_in_stock)
  end

  def find_plant
    Plant.find(params[:id])
  end

  def render_no_plant
    render json: {error: "error no plant"}
  end


end
