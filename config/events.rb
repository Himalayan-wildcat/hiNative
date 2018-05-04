# WebsocketRails::EventMap.describe do
#   # The :client_connected method is fired automatically when a new client connects
#   subscribe :client_connected, to: ChatController, with_method: :client_connected
#
#   subscribe :send_message, "chats#index"
#
#   # The :client_disconnected method is fired automatically when a client disconnects
#   subscribe :client_disconnected, to: ChatController, with_method: :delete_user
# end
