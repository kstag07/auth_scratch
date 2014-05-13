class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
      if user
        session[:user_id] = user.id
        redirect_to root_url, :notice => "Logged in!"
      else
        flash.now.alert = "Invalid email or password"
        rend "new"
      end
  end

  def destroy
    session[:uder_id] = nil
    redirect_to root_url, :notice => "logged out"
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
