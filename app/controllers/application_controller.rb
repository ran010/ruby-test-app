class ApplicationController < ActionController::Base
  before_action :authenticate_employee!
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || purchases_path)
  end
  def pundit_user
    current_employee
  end
end
