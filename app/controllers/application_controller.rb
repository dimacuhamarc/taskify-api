class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])

    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

#   def authenticate_user!
#     return if user_signed_in?

#     render json: { error: 'You need to sign in or sign up before continuing.' }, status: :unauthorized
#   end

#   def current_user
#     @current_user ||= User.find_by(authentication_token: request.headers['Authorization'])
#   end

#   def user_signed_in?
#     current_user.present?
#   end
end
