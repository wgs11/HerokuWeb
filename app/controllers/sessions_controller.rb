class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(twitch_profile_name: params[:session][:twitch_profile_name])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid twitch name/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to request.referrer
  end
end