class ApplicationController < ActionController::Base
  before_action :authenticate_user! # devise
  include Pundit::Authorization # pundit
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Pundit: white-list approach
  # unless then runs skip_pundit method so check whether signed in on devise.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def configure_permitted_parameters
    # upon sign up, allow for the additional key: username
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username avatar])
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
