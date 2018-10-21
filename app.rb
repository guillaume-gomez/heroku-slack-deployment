require 'dotenv/load'
require 'byebug'
require 'sinatra'
require 'json'

require_relative 'app/heroku_helper'
require_relative 'modules/slack_helper'

# require_relative 'app/slack_authorizer'
# use SlackAuthorizer
# use it when slack/command will be enable
post '/slack/command' do
  "Ok, this is a test message for a bot. Sorry to bother you ! :)"
end

post '/heroku/hooks' do
  body = JSON.parse(request.body.read)
  post_deployment_message("#general", filtered_params(body))
end