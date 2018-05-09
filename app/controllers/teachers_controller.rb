class TeachersController < ApplicationController

  def index
    @targetid = User.find(params[:id]).id
    @user = current_user
    @chats = Chat.all.select{ |chat| [chat.user_id, chat.target_id].include?(params[:id].to_i) }
  end
end
