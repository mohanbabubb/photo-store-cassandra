class HomeController < ApplicationController
  skip_before_action :require_login

  def index
  end

  def new
	@user = Home.new
  end

  def show
  end

  def aboutus
  end

  def create
    @user = Home.new(user_params.except(:password_confirmation))
     if user_params[:password] == user_params[:password_confirmation]
      if @user.save
        redirect_to home_path @user
      else
        render :action => 'new'
      end
     else
       flash[:danger] = 'Invalid email/password combination' # Not quite right!
       render 'new'
     end

end

  private

  def user_params
    params.require(:home).permit(:email,:username,:password,:password_confirmation,:role,:password,:remember_token)
  end

end
