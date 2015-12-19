class UsersController < ApplicationController
 #before_filter tells the controller to run a given method before any other method
 # set of instructions to run before any others
  before_filter :current_user, except: [:create, :new]
  def create
      @user= User.create(user_params)
      if @user.valid?
        flash[:success] = "You have successfully registered"
        redirect_to "/"
      else
        #flash[:registration_errors] = @user.errors - inplicitly prints messages
        #flash[:registration_errors] = @user.errors.messages - explicitly prints messages

        flash[:registration_errors] = @user.errors.full_messages #prettify message
        redirect_to "/"
      end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to "/"
  end
  def edit
    @user = @current_user
    unless @user == User.find(session[:user_id])
      redirect_to user_edit_url(session[:user_id]) #helper method
      # user_edit_url goes to http://localhost:XXXX/users/:id/edit
      # user_edit_path goes /users_/:id/edit
    end
  end
  def update
    user = User.find(params[:id])
    unless user == @current_user
      redirect_to user_show_url(session[:user_id]) and return
    end

    if user.update(user_params)
      redirect_to user_show_url(session[:user_id])
    else
      flash[:edit_errors]=user.errors.full_messages
      redirect_to user_edit_url(params[:id])
    end
  end

  def new
    if session[:user_id].present?
      redirect_to "/the_wall"
    end
  end

  def index

  end

  def show
    @user = User.find(params[:id])
    if @user.location == "San Jose, CA"
      @long = -121.91198079999998
      @lat = 37.3772409
    elsif @user.location == "Seattle, WA"
      @long = -122.19654689999999
      @lat = 47.6098193
    elsif @user.location == "Burbank, CA"
      @long = -118.309180
      @lat = 34.180817
    end


  end



  private

  def user_params
    params.require(:user).permit(:name,:email,:location,:password,:password_confirmation)
  end

  def current_user
    @current_user = User.find(session[:user_id])
  end

end
