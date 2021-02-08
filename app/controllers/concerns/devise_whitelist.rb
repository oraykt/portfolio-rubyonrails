module DeviseWhitelist
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters,
                  if: :devise_controller?
  end

  def configure_permitted_parameters
    # devise knows sign_up and account_update keywords on usage.
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[nickname])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[nickname])
  end
end
