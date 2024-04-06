# app/controllers/api/v1/registrations_controller.rb

class Api::V1::RegistrationsController < Devise::RegistrationsController
  skip_before_action :verify_authenticity_token
  respond_to :json

  def create
    build_resource(sign_up_params)

    if resource.save
      render json: { user: resource, token: current_token }
    else
      render json: { errors: resource.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def current_token
    request.env['warden-jwt_auth.token']
  end

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username)
  end
end
