class UsersController < ApplicationController

  before_action :set_user, only:[:index, :edit,:update,:destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
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
    if session[:user_id].nil?
      flash[:alert] = "Please Login First"
      return redirect_to root_path
    end

  end

  def update
    @params = params[:user].permit(:username, :age, :account, :password, :avatar)
    @params[:password] = User.encrypt_password(@params[:password])
    if @user.update(@params)
      redirect_to root_path
    else
      flash[:alert] = @user.errors.full_messages.join(",")
      render :edit
    end
  end

  def destroy
    if @user.destroy
      if params[:id] == @user.id
        reset_session
      end
      redirect_to root_path, notice: "User Deleted"
    else
      flash[:alert] = @user.errors.full_messages.join(",")
      redirect_to users_path
    end
  end

  def login
    @params = params[:user].permit(:account, :password)
    @user = User.where(account: @params[:account], password: User.encrypt_password(@params[:password])).first
    if @user.nil?
      redirect_to root_path, alert: "Login Failed"
    else
      session[:user_id] = @user.id
      return redirect_to root_path, notice: "Login Succeeded"
    end
  end

  def logout
    if !session[:user_id].nil?
      reset_session
      redirect_to root_path, notice: "Logout Succeeded"
    else
      redirect_to root_path
    end
  end


  private
  def set_user
    if session[:user_id].nil?
      return redirect_to root_path, notice: "User must login"
    else
      @user = User.find(session[:user_id].to_i)
    end
  end
end

