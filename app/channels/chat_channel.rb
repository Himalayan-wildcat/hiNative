class ChatChannel < ApplicationCable::Channel
  # Called when the consumer has successfully
  # become a subscriber to this channel.
  def subscribed
    # user = User.find_by(id: params[:room])
    # if user.admin_flg
    #     stream_from 'all'
    # else
    #     stream_from "chat_room#{params[:room]}"
    # end
    stream_from "chat_channel_#{params[:userId]}"

  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    chat = Chat.new(text: data['message'], user_id: data['userId'])

    if chat.save
      ActionCable.server.broadcast "chat_channel_#{params[:userId]}",
      message: chat,
      user_type: chat.user.admin_flg,
      user_name: chat.user.name
    else
      ActionCable.server.broadcast "chat_channel_#{params[:userId]}",
      error: chat.errors.full_messages
    end
  end
end
