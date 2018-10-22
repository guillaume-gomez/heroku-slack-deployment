require 'httparty'


module Sinatra
  module HerokuSlack
    module SlackHelper

      def format_deployment_message(data)
        return "" if data.nil?
        return "" if data[:app_name].nil?
        return "" if data[:actor].nil?
        return "" if data[:created_at].nil?
        date = DateTime.parse(data[:created_at])
        "*#{data[:app_name]}*\nhas been successfully deployed by _#{data[:actor]}_ at #{date.strftime("%D %H:%m")}"
      end


      def post_deployment_message(data)
        webhook_link =  ENV['SLACK_WEBHOOK_URL']
        username = "HerokuSlack Bot"

        content = format_deployment_message(data)
        return if content.empty?
        options = 
        options  = {
          body: {
            "text": content,
            "username": username,
            "mrkdwn": true
          }.to_json,
          headers: { 'Content-Type' => 'application/json' }
        }
        HTTParty.post(webhook_link, options)
      end

    end
  end
end



