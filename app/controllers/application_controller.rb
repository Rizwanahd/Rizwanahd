# frozen_string_literal: true

# its applicationcontroller.rb
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:notice] = 'Sorry, You Are Not Authorized To Do This'
    redirect_to(request.referrer || root_path)
  end

  protected

  def configure_permitted_parameters
    attributes = %i[name role username email]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end
end
