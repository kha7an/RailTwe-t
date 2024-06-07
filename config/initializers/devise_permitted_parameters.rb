# config/initializers/devise_permitted_parameters.rb
module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters, if: :devise_controller?
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :password_confirmation, :current_password, :avatar])
  end
end

Rails.application.config.to_prepare do
  Devise::RegistrationsController.include DevisePermittedParameters
end
