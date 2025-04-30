module Admin
  class UsersController < ApplicationController
    before_action :require_admin

    def index
      @users = User.all.order(:name)
    end

    private

    def require_admin
      unless current_user&.admin?
        redirect_to root_path, alert: "Access denied."
      end
    end
  end
end
