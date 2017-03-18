class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login

  helper_method :clipboard, :current_user, :signed_in?, :permitted_params

  protected

  def clipboard
    session[:clipboard] ||= Clipboard.new
  end

  def current_user
    begin
    @current_user = Home.find_by_username(session[:user_id])
    rescue
      @current_user = nil
    end
  end


  def signed_in?
    !current_user.nil?
  end

  def require_login
    if current_user.nil?
      user = Home.find_by_remember_token(cookies[:auth_token]) unless cookies[:auth_token].blank?

      if user.nil?
        reset_session
        session[:user_id] = nil
        session[:return_to] = request.fullpath
        redirect_to new_session_url
      else
        user.refresh_remember_token
        session[:user_id] = user.id
        cookies[:auth_token] = user.remember_token
      end

    end

  end


end
