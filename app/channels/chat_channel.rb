class ChatChannel < ApplicationCable::Channel
  # Called when the consumer has successfully
  # become a subscriber to this channel.
  def subscribed
    stream_from "chat_channel_#{params[:userId]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    if current_user.admin
      chat = Chat.new(text: data['message'], user_id: current_user.id, target_id: params[:userId])
      # adminのチャット画面が出来るまで、target_idを送るフォームはない
    else
      chat = Chat.new(text: data['message'], user_id: current_user.id)
    end

    if chat.save
      ActionCable.server.broadcast "chat_channel_#{params[:userId]}",
      message: chat,
      user_id: chat.user.id,
      user_name: chat.user.name
    else
      ActionCable.server.broadcast "chat_channel_#{params[:userId]}",
      error: chat.errors.full_messages
    end
  end
end
