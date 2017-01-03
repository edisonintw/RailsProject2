class CommentsController < ApplicationController

  before_action :set_user, only: [:index,:new,:edit,:create,:update,:destroy]
  before_action :set_comment, only: [:edit, :update, :destroy]

  def index
    @comments = Comment.all
  end


  def show
    @user = User.find(params[:user_id])
    @comment = @user.comments.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
   @params = params[:comment].permit(:message)
   @comment = @user.comments.new(@params)
   if @comment.save
     redirect_to root_path
   else
     flash[:alert] = @comment.errors.full_messages.join(",")
     render :new
   end
  end

  def edit
  end

  def update
    @params = params[:comment].permit(:message)
    if @comment.update(@params)
      redirect_to user_comments_path
    else
      flash[:alert] = @comment.errors.full_messages.join(",")
      render :edit
    end
  end

  def destroy
    if @comment.destroy
      redirect_to user_comments_path
    else
      flash[:alert] = @user.errors.full_messages.join(",")
      redirect_to user_comments_path
    end
  end

  private
  def set_user
    @user = User.find(session[:user_id])
  end

  def set_comment
   @comment  = @user.comments.find(params[:id])
  end


end
