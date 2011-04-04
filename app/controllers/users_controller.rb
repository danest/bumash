class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      #we want to sign them in and also send them to the root page
      flash[:success] = "Successful sign up"
      sign_in(@user)
      redirect_to vote_path
    else
      @user.email = ""
      render 'new'
    end
  end
  
  
  
  
end