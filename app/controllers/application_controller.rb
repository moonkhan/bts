class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :authenticate_user!,:configure_permitted_parameters, if: :devise_controller?
    protected
      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation, :user_type])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :current_password, :user_type])
        #devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :is_female, :date_of_birth) }
      end
      # Overwriting the sign_out redirect path method
      def after_sign_out_path_for(resource_or_scope)
        new_user_session_path
      end
end
