class ChatsController < ApplicationController


  def index
    @chat = Chat.new
    @chats = Chat.all
    # ActionCable.server.broadcast(‘users’, messages: @chats)
  end

  # def create
  #   if @chat = Chat.create!(params_message)
  #      ChatChannel.broadcast_to @chat.text, message: render_message(@message)
  #   end
  # end

  private
  def params_message
    params.require(:chat).permit(:text).merge(user_id: current_user.id)
  end

  # def render_message(message)
  #     ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  # end
end
