class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    if params[:keywords].present?
      @products = Product.search params[:keywords], fields: [:name]
      puts @products
    end
  end

  def search
  end

  def application_params
    params.require(:application).permit(:id, :keywords)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :website, :logo, :name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :website, :logo, :name])
  end
end
