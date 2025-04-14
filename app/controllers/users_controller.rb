class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy, :edit, :update, :set_admin, :remove_admin]
  before_action :authorize_admin!, only: [:set_admin, :remove_admin]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to login_path, notice: "Account created! Please log in."
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to dashboard_path, notice: "Profile updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  def set_admin
    @user.update(admin: true)
    redirect_to @user
  end

  def remove_admin
    @user.update(admin: false)
    redirect_to @user
  end

  def authorize_admin!
    redirect_to root_path, alert: "You’re not authorized." unless current_user&.admin?
  end

  private

  def set_user
    @user = User.find(params[:id])
    unless @user == current_user || current_user&.admin?
      redirect_to dashboard_path, alert: "You’re not authorized to access this page."
    end
  end
  

  def user_params
    permitted = [:name, :email, :password, :password_confirmation]
    permitted << :admin if current_user&.admin?
    params.require(:user).permit(permitted)
  end
end
