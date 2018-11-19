# Engine configuration.
module Grape
  module ForgeryProtection
    class << self
      attr_writer :configuration

      def configuration
        @configuration ||= Configuration.new
      end

      def configure
        yield(configuration)
      end
    end

    # Configuration variables and defaults.
    class Configuration
      def initialize; end
    end
  end
end
