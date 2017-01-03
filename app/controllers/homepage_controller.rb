class HomepageController < ApplicationController

  def index
    @user = User.new
    if !session[:user_id].nil?
      @current_user = User.find(session[:user_id])
    end

  end



end

