# app/controllers/dashboard_controller.rb

class DashboardController < ApplicationController
  before_action :require_user_logged_in

  def show
    if current_user.admin?
      # If the current user is an admin, render the admin dashboard
      @users = User.all
      render 'admin_dashboard'
    else
      # Otherwise, render the user dashboard
      render 'user_dashboard'
    end
  end

  def admin
    @users = User.all
    render 'admin_dashboard'
  end  

  private

  def require_user_logged_in
    unless session[:user_id]
      redirect_to login_path, alert: 'You need to log in first'
    end
  end
end
