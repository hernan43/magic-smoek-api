class AuthController < ApplicationController
  allow_unauthenticated_access only: [ :create ]

  def create
    @current_user = User.find_by(email: params[:email])
    if @current_user && @current_user.authenticate(params[:password])
      encoded_token = encode(@current_user)
      render json: { token: encoded_token }, status: :ok
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end
end
