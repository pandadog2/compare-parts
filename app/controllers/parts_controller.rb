class PartsController < ApplicationController
  before_action :new_part, only: [:new, :create]
  before_action :edit_part, only: [:edit, :update, :destroy]
  before_action :search_part, only: [:index, :search]

  def index
    @car_models = CarModel.order(:car_model_code)
    @parts = Part.all
    set_part_column
    @car_model = CarModel.new
  end

  def new
    @part = Part.new
  end

  def create
    @part = Part.new(part_params)
    if @part.save
      redirect_to car_model_part_path(id: @part)
    else
      render :new
    end
  end

  def show
    @part = Part.find(params[:id])
  end

  def edit
  end

  def update
    @part.images.detach #紐づいている画像を削除
    if @part.update(part_update_params)
      redirect_to car_model_part_path(id: @part)
    else
      render :edit
    end
  end

  def destroy
    part = Part.find(params[:id])
    part.destroy
    redirect_to root_path
  end

  def search
    @result = @q.result
    @results = @q.result.includes(:car_model)
    if @results.length == 1
      @results.each do |result|
        redirect_to car_model_part_path(result.car_model.id, result.id)
      end
    end
  end

  private

  def part_params
    params.require(:part).permit(:product_number, :part_name_id, :material_id, :thickness, :weight, :supplier_id, :approval_date, :reference_parts, images: []).merge(user_id: current_user.id, car_model_id: params[:car_model_id])
  end

  def part_update_params
    params.require(:part).permit(:car_model_id, :product_number, :part_name_id, :material_id, :thickness, :weight, :supplier_id, :approval_date, :reference_parts, images: [])
  end

  def new_part
    @car_model = CarModel.find(params[:car_model_id])
  end

  def edit_part
    @part = Part.find(params[:id])
    if @part.user_id != current_user.id
      redirect_to car_model_part_path(id: @part)
    end
  end

  def search_part
    @q = Part.ransack(params[:q])
  end

  def set_part_column
    @part_part_name = Part.select('part_name_id').distinct
    @part_product_number = Part.select('product_number').distinct
  end
end
