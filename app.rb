require 'dotenv/load'
require 'byebug'
require 'sinatra'
require 'json'

#use SlackAuthorizer

require 'sinatra/base'

class HerokuSlack < Sinatra::Base

  helpers Sinatra::HerokuSlack::SlackHelper
  helpers Sinatra::HerokuSlack::HerokuHelper

  post '/slack/command' do
    "Ok, this is a test message for a bot. Sorry to bother you ! :)"
  end

  post '/heroku/hooks' do
    body = JSON.parse(request.body.read)
    post_deployment_message("#general", filtered_params(body))
  end
end


