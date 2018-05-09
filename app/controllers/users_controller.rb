class UsersController < ApplicationController
  def management
    if current_user.id == params[:id] || current_user.admin
      @user = User.all
    else
      render :index
    end
  end
end
