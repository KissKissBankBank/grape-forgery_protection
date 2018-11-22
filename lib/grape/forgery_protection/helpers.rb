module Grape
  module ForgeryProtection
    module Helpers
      def csrf_token_from_headers
        request.headers['X-CSRF-Token'].presence ||
          request.headers['X-Csrf-Token']
      end

      def form_authenticity_token
        session[:_csrf_token] ||= SecureRandom.base64(32)
      end

      def protect_against_forgery
        return if verified_request?

        error!('Unauthorized', 401)
      end

      def protect_against_forgery?
        allow_forgery_protection = Rails
          .configuration
          .action_controller
          .allow_forgery_protection

        allow_forgery_protection.nil? ||
          allow_forgery_protection
      end

      def session
        env['rack.session']
      end

      def verified_request?
        !protect_against_forgery? ||
          request.get? ||
          request.head? ||
          form_authenticity_token == csrf_token_from_headers
      end
    end
  end
end
