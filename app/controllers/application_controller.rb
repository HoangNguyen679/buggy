# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :config_devise_params, if: :devise_controller?

  protected

  def config_devise_params
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: %i[
        username
        email
        password
        password_confirmation
      ],
    )

    devise_parameter_sanitizer.permit :sign_in, keys: %i[login password]
  end

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to root_path
    end
  end
end
