class ApplicationController < ActionController::Base

  before_filter :configure_permitted_parameters, if: :devise_controller?
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :nickname, :adress) }
      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password, :password_confirmation) }
    end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

   def after_sign_in_path_for(resource)
    products_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

end
