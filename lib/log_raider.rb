require "log_raider/version"

module LogRaider
  class Interceptor
    def initialize
      @real_logger = Rails.logger
    end

    def intercept!
      @real_logger.class_eval do
        def error_with_newrelic_reporting(message)
          return_value = error_without_newrelic_reporting(message)
          NewRelic::Agent.notice_error(Exception.new("From Rails error log: #{message}"))
          return_value
        end

        alias_method :error_without_newrelic_reporting, :error
        alias_method :error, :error_with_newrelic_reporting
      end
    end
  end

  class Railtie < Rails::Railtie
    initializer "LogRaider initializer" do |app|
      LogRaider::Interceptor.new.intercept!
    end
  end
end
