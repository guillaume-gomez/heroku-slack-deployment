require 'dotenv/load'
require 'sinatra'

require_relative 'app/slack_authorizer'
use SlackAuthorizer


post '/slack/command' do
  "Ok, this is a test message for a bot. Sorry to bother you ! :)"
end