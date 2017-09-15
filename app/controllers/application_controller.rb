class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
  end

  def application_params
    params.require(:application).permit(:id)
  end

  #def after_sign_in_path_for(resource_or_scope)
    #my_index_evaluations_path
  #end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :website, :logo, :name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :website, :logo, :name])
  end
end
