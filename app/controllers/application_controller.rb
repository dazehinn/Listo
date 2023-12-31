class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:splash]
  before_action :update_allowed_parameters, if: :devise_controller?

  def splash
    redirect_to new_user_registration_path
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password, :current_password)
    end
  end

  private

  def after_sign_in_path_for(_resource)
    categories_path
  end
end
