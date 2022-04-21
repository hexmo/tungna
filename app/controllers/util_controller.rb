# frozen_string_literal: true

# all controller method that do not follow resources conventions go here
class UtilController < ApplicationController
  before_action :authenticate_user!

  # GET /user_detail
  def user_detail
    render json: { name: current_user.name, email: current_user.email }
  end
end
