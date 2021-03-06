class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorized #lock down this whole app
  helper_method :current_user #i can call current_user from a view

  def current_user
    # User.find would throw an error if we cannot find the user
    User.find_by({ id: session[:user_id] })
  end

  def logged_in?
    !!current_user
  end

  def authorized
    redirect_to login_path unless logged_in?
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  rescue
    render_404
  end

  def render_404
    render file: "#{Rails.root}/app/views/mains/404", status: :not_found
  end
end
