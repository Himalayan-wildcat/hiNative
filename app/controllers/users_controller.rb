class UsersController < ApplicationController
  def management
    @user = User.all
  end
end
