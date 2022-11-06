class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  get '/messages' do
    messages = Message.all
    messages.to_json
  end

  post '/messages' do
    messages = Message.create(
      body: params[:body],
      username: params[:username],
      created_at: params[:created_at],
      updated_at: params[:updated_at]
    )
    messages.to_json
  end

  patch '/messages/:id' do
    messages = Message.find(params[:id])
    messages.update(
      body: params[:body]
    )
    messages.to_json
  end

  delete '/messages/:id' do
    messages = Message.find(params[:id])
    messages.destroy
    messages.to_json
  end

end
