module Sinatra
  module HerokuSlack
    module HerokuHelper

      def valid_signature?(request, webhook_secret)
        calculated_hmac = Base64.encode64(OpenSSL::HMAC.digest(
          OpenSSL::Digest.new('sha256'),
          webhook_secret,
          request.raw_post
        )).strip
        heroku_hmac = request.headers['Heroku-Webhook-Hmac-SHA256']

        heroku_hmac && Rack::Utils.secure_compare(calculated_hmac, heroku_hmac)
      end

      def filtered_params(request)
        data = request["data"]
        app_name = data["app"]["name"]
        created_at = data["created_at"]
        status = data["status"]
        actor = request["actor"]["email"]
        { app_name: app_name, created_at: created_at, status: status, actor: actor }
      end

    end
  end
end