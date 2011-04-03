class SessionsController < ApplicationController
  
  def new
    
  end
  
  def create
    user = User.authenticate(params[:session][:email])
    if user.nil?
      flash.now[:error] = "Invalid email"
      render 'new'
    else
      #this user has succesfully entered a password
      sign_in user
      redirect_to vote_path , :notice => "Click on the image or button, to vote the hotter one."
    end
  end
  
  def destroy
    sign_out
    flash[:notice] = "Signed Out"
    redirect_to root_path
  end
end