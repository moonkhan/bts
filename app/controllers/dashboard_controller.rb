class DashboardController < ApplicationController
  before_action :check
  def index
  end
  protected
    def check
      if !user_signed_in?
        redirect_to new_user_session_path
      end
    end
end
