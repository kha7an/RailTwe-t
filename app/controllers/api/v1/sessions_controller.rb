# app/controllers/api/v1/sessions_controller.rb

class Api::V1::SessionsController < Devise::SessionsController
  skip_before_action :verify_signed_out_user
  skip_before_action :verify_authenticity_token

  respond_to :json

  def create
    user = User.find_for_database_authentication(email: params[:user][:email])
    if user && user.valid_password?(params[:user][:password])
      warden.set_user(user, scope: :user)
      debugger
      render json: { user: user, token: current_token }
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  private

  def current_token
    request.env['warden-jwt_auth.token']
  end
end
