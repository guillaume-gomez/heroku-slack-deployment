require_relative 'helpers/heroku_helper'
require_relative 'helpers/slack_helper'

require_relative 'app/slack_authorizer'

#require_relative 'models/heroku_webhook'

require './app'
run HerokuSlack
