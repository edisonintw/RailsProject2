class UsersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @params = params[:user].permit(:username, :age, :account, :password)
    @user = User.new(@params)
    if @user.save
      redirect_to root_path
    else
      flash[:alert] = @user.errors.full_messages.join(",")
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destory
  end

  def login
  end

end
