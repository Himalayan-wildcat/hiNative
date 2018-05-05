class ChatChannel < ApplicationCable::Channel
  # Called when the consumer has successfully
  # become a subscriber to this channel.
  def subscribed
    stream_from 'chat_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # binding.pry
    chat = Chat.create(text: data['message'], user_id: 1)
    ActionCable.server.broadcast 'chat_channel', message: data['message']
  end
end
