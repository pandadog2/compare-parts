class ApplicationController < ActionController::Base
  # before_action :basic_auth
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def set_search
    @q = Part.ransack(params[:q])
    @result = @q.result
    @results = @q.result.includes(:car_model)
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
