require 'sinatra'
require 'json'
require 'sinatra/reloader' if development?

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

get '/messages' do
  content_type :json
  { message: 'Hello, world!' }.to_json
end

# Start the server
set :port, 3000
set :bind, '0.0.0.0'

# Run the application
run! if app_file == $0
