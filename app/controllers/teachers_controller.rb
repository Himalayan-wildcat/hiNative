class TeachersController < ApplicationController

  def index
    @user = current_user
    @chats = Chat.all.includes(:user).select{ |chat| [current_user.id, params[:id]].include?(chat.user_id) }
    binding.pry
  end
end
