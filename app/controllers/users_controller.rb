class UsersController < ApplicationController

  def new
    @user = User.new
    @title = 'Sign up' 
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      # Handle a successful save.
      flash[:success] = "Welcome to the Sample App!"
      sign_in @user
      redirect_to @user
    else
      @user.password = ''
      @user.password_confirmation = ''
      @title = "Sign up"
      render 'new'
    end
  end



end
