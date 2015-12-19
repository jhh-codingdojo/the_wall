class SessionsController < ApplicationController
  def create
    user = User.find_by(email: login_params[:email])
    if user
      if user.authenticate(login_params[:password])
        session[:user_id] = user.id
        redirect_to "/the_wall"
      else
        # bad password
        flash[:login_error] = "User ID or password incorrect"
        redirect_to "/"
      end
    else
      flash[:login_error] = "User ID or password incorrect"
      # bad email
      redirect_to "/"
    end
  end

  def destroy
    session[:user_id]= nil
    redirect_to "/"
  end
  private

  def login_params
    params.require(:login).permit(:email, :password)
  end
end
