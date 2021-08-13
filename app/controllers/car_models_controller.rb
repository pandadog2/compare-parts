class CarModelsController < ApplicationController
  def index
    @car_models = CarModel.order(:car_model_code)
  end

  def new
    @car_model = CarModel.new
  end

  def create
    @car_model = CarModel.new(car_model_params)
    @car_model.save
    redirect_to root_path
  end

  private

  def car_model_params
    params.require(:car_model).permit(:car_model_code).merge(user_id: current_user.id)
  end
end
