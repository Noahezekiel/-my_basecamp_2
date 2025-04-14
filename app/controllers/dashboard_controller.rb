# app/controllers/dashboard_controller.rb
class DashboardController < ApplicationController
  before_action :require_user_logged_in

  def show
    if current_user.admin?
      @users = User.all
    else
      @projects = current_user.projects
    end
    render 'show' # Always render the same dashboard view for both users and admins
  end

  private

  def require_user_logged_in
    unless session[:user_id]
      redirect_to login_path, alert: 'You need to log in first'
    end
  end
end
