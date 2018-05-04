class ChatsController < ApplicationController

  def index
    @chat = Chat.new
  end
end
