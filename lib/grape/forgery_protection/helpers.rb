module Grape
  module ForgeryProtection
    module Helpers
      def session
        env['rack.session']
      end

      def protect_against_forgery
        error!('Unauthorized', 401) unless verified_request?
      end

      def verified_request?
        !protect_against_forgery? || request.get? || request.head? ||
          form_authenticity_token == csrf_token_from_headers
      end

      def csrf_token_from_headers
        request.headers['X-CSRF-Token'].presence ||
          request.headers['X-Csrf-Token']
      end

      def form_authenticity_token
        session[:_csrf_token] ||= SecureRandom.base64(32)
      end

      def protect_against_forgery?
        allow_forgery_protection = Rails
          .configuration
          .action_controller
          .allow_forgery_protection

        allow_forgery_protection.nil? || allow_forgery_protection
      end
    end
  end
end
