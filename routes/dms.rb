require 'sinatra'
require 'json'

# Initialize an empty array for storing messages
MESSAGES = []

# Route to handle GET requests for messages
get '/messages' do
  content_type :json
  MESSAGES.to_json
end

# Route to handle POST requests to add a new message
post '/messages' do
  request.body.rewind
  message = JSON.parse(request.body.read)
  MESSAGES << message
  status 201
  content_type :json
  message.to_json
end
