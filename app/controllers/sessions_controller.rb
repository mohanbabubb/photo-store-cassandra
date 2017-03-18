class SessionsController < ApplicationController
  skip_before_action :require_login

  def new
  end

  def create
    user = Home.authenticate(params[:username], params[:password])

    unless user.nil?

      if params[:remember_me] == 'true'
        user.refresh_remember_token
        cookies[:auth_token] = { :value => user.remember_token, :expires => 2.weeks.from_now }
      end

      session[:user_id] = params[:username]

      redirect_url = session.delete(:return_to) || items_url
      redirect_to redirect_url, :only_path => true
    else
      log_failed_sign_in_attempt(Time.now, params[:username], request.remote_ip)
      redirect_to new_session_url, :alert => t(:credentials_incorrect)
    end
  end

  def destroy
    current_user.forget_me if !current_user.nil?
    cookies.delete :auth_token
    reset_session
    session[:user_id] = nil
    redirect_to new_session_url
  end

  private

  def log_failed_sign_in_attempt(date, username, ip)
    Rails.logger.error(
        "\nFAILED SIGN IN ATTEMPT:\n" +
            "=======================\n" +
            " Date: #{date}\n" +
            " Username: #{username}\n" +
            " IP address: #{ip}\n\n"
    )
  end

end