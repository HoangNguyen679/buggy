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
      ]
    )

    devise_parameter_sanitizer.permit :sign_in, keys: %i[login password]
  end
end
