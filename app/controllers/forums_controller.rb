class ForumsController < ApplicationController

  before_action :set_user, except: [:index]

  def index
  end

  def new
  end

  def show
  end

  def create
  end

  def destroy
  end

  def edit
  end

  def update
  end

  private
  def set_user
    if !session[:user_id].nil?
      @user = User.find(session[:user_id])
    else
      redirect_to root_path
    end
  end

end
