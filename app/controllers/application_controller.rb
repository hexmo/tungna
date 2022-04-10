# frozen_string_literal: true

class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    render json: { appName: 'Tungna', version: '21.1.8' }, status: 200
  end

  protected

  # https://stackoverflow.com/questions/55311755/adding-extra-fields-to-devise-token-auth-user-sign-up
  def configure_permitted_parameters
    added_attrs = %i[name email password password_confirmation]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
