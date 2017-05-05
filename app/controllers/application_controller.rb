class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # this is called before anything else because 'before'
  # configure... is a custom name, nothing special about it!
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:signup, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
