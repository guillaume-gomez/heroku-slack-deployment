require 'httparty'

def format_deployment_message(channel, data)
  return "" if data.nil?
  return "" if data[:app_name].nil?
  return "" if data[:actor].nil?
  return "" if data[:created_at].nil?
  date = DateTime.parse(data[:created_at])
  "*#{data[:app_name]}*\nhas been successfully deployed by _#{data[:actor]}_ at #{date.strftime("%D %H:%m")}"
end


def post_deployment_message(channel, data)
  webhook_link = "https://hooks.slack.com/services/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"
  username = "My awesome bot"

  content = format_deployment_message(channel, data)
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