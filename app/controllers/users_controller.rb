class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy, :edit, :update, :set_admin, :remove_admin]

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
      redirect_to @user
    else
      render :edit
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

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    permitted = [:name, :email, :password, :password_confirmation]
    permitted << :admin if current_user&.admin?
    params.require(:user).permit(permitted)
  end
end
