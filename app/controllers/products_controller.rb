class ProductsController < ApplicationController
  before_filter :authenticate, :only => [:index, :new, :show, :top , :edit, :update, :create]
  def show
    @products = Product.all.sort_by {rand}[0..1]
  end
  
  def index 
  
  end
  
  def top
    @products = Product.order('votes DESC').limit(10)
  end
  
  def edit
    @user = Product.find(params[:id])
  end
  
  def update
    @product = Product.find_by_id(params[:id])
    if @product.update_attributes(:votes => (@product.votes + 1))
      flash[:success] = "Vote Successful"
      redirect_to vote_path
    else
      flash[:error] = "Sorry error voting "
      redirect_to vote_path
    end
  end
  
  def create
    @product = Product.create(params[:product])
    if @product.save
      flash.now[:success] = "Saved image upload another one or go browse"
      render 'new'
    else
      flash.now[:error] = "Sorry it must be an JPG or PNG and less then 5MB"
      render 'new'
    end
  end
  
  
  def new
    @product = Product.new
  end
end