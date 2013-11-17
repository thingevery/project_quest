class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authorize
  	redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end

  private
  	def current_user
  		#@current_user ||= User.find(session[:user_id]) if session[:user_id]
      @current_user ||= User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]

      #rescue ActiveRecord::RecordNotFound # Not sure this is needed. I added this
      #  @current_user = nil               # while troubleshooting a different 
      #  cookies.delete(:auth_token)       # problem and this wasn't the solution.
  	end
  	helper_method :current_user
end
