class SessionsController < ApplicationController
  def new
    @title = "Sign in"
	if current_user
	  flash[:error] = 'You have already logged in. '
	end
  end
  
  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?
      flash.now[:error] = 'Invalid email/password combination.'
      @title = "Sign in"
      render 'new'
    else
      sign_in user
	  flash[:notice] = 'Login Successful'
      #redirect_to user
	  redirect_to home_path
    end
  end

  def destroy
    sign_out
	redirect_to signin_path
  end
end
