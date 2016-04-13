require 'sinatra'
require 'json'
require 'httparty'
 
#Bound to this address so that external hosts can access it, VERY IMPORTANT!
set :bind, '0.0.0.0'
 
set :logging, true

URL = "https://graph.facebook.com/v2.6/me/messages?access_token=#{ENV["PAGE_ACCESS_TOKEN"]}"

post '/page_webhook' do
  body = request.body.read
  payload = JSON.parse(body)
  
  # get the sender of the message
  sender = payload["entry"].first["messaging"].first["sender"]["id"]
  
  # get the message text
  message = payload["entry"].first["messaging"].first["message"]
  message = message["text"] unless message.nil?

  # echoing message back if it isn't a confirmation message from Facebook messenger API
  unless message.nil?
    @result = HTTParty.post(URL, 
        :body => { :recipient => { :id => sender}, 
                   :message => { :text => message}
                 }.to_json,
        :headers => { 'Content-Type' => 'application/json' } )
  end
  
end

get '/page_webhook' do
  params['hub.challenge'] if ENV["VERIFY_TOKEN"] == params['hub.verify_token']
end
 
get '/' do
  html = <<-HTML
<html>
<body>

Hello robots OverLords!

</body>
</html>
HTML

  html
end