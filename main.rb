require 'sinatra'
require 'json'
require_relative 'messages'

before do
  if request.content_type == 'application/json'
    request.body.rewind
    request.body.read
    @data = JSON.parse(request.body.read)
  end
end

configure do
  set :public_folder, 'public'
end

# Include the messages routes
require_relative 'messages'

# Start the server
set :port, 3000
set :bind, '0.0.0.0'

# Run the application
run! if app_file == $0
