class ApplicationController < ActionController::Base
  before_action :set_current_user
  before_action :authenticate

  private

  def set_current_user
    Current.user = User.find_by(id: cookies.encrypted[:user_id])
  end

  def authenticate
    redirect_to users_path if Current.user.nil?
  end
end
