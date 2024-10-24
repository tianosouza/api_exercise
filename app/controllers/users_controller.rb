class UsersController < ApplicationController
  before_action :authorize, only: [ :index ]

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(user_params)

    if @user.save
      token = encode_token(user_id: @user.id)
      render json: { user: @user, token: token }, status: :created
    else
      render json: { errors: @user.errors }, status: :unprocessable_entity
    end
  end

  def sign_in
    if user_params[:username].blank? || user_params[:password].blank?
      return render json: { error: "Username and password are required" }, status: :unprocessable_entity
    end

    @user = User.find_by(username: user_params[:username])

    if @user.nil?
      return render json: { error: "Username not found" }, status: :unprocessable_entity
    end

    if @user.authenticate(user_params[:password])
      token = encode_token(user_id: @user.id)
      render json: { user: @user, token: token }, status: :ok
    else
      render json: { error: "Incorrect password" }, status: :unprocessable_entity
    end
  end

  def destroy
    unless is_admin?
      return render json: { error: "Access denied: Only administrators can delete users." }, status: :forbidden
    end

    @user = User.find(params[:id])
    if @user&.destroy
      render json: { message: "User deleted" }, status: :ok
    else
      render json: { error: "User not found" }, status: :not_found
    end
  end

  private

  def is_admin?
    current_user&.role == "admin"
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :first_name, :last_name, :email)
  end
end
