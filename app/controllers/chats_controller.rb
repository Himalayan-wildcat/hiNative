class ChatsController < ApplicationController
  def index
    @user = current_user
    @chats = Chat.all.includes(:user).select{ |chat| chat.target_id == current_user.id or
      chat.user_id == current_user.id }
  end

  private
  def params_message
    params.require(:chat).permit(:text).merge(user_id: current_user.id)
  end
end
