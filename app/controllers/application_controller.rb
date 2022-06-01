# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  def authenticate_admin!
    redirect_to root_path, notice: 'Not authorize' unless current_user.admin?
  end
end
