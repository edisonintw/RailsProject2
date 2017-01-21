class PostsController < ApplicationController

  before_action :set_user, only:[:new, :create, :edit, :update, :destroy ]

  def index
    @posts = Post.all
  end

  def show
    @thread = Thread.find(params[:id])
    if !session[:user_id].nil?
      @user = User.find(session[:user_id])
    end
  end


  def new
    if session[:user_id].nil?
      flash[:alert] = "Please Login First"
      return
    end
    @thread = Thread.new
  end

  def create
    @params = params[:user].permit(:title, :content)
    @thread = Thread.new(@params)
    if @thread.save
      redirect_to threads_path
    else
      flash[:alert] = @thread.errors.full_messages.join(",")
      render :new
    end

  end

  def edit
    if session[:user_id].nil?
      flash[:alert] = "Please Login First"
      return
    end
  end

  def update
    @params = params[:user].permit(:title, :content)
    @thread = Thread.new(@params)
    if @thread.save
      redirect_to threads_path
    else
      flash[:alert] = @thread.errors.full_messages.join(",")
      render :new
    end
  end

  def destroy
    if @thread.destroy
      redirect_to threads_path, notice: "Thread Deleted"
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

