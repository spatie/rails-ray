require "rails/ray/version"
require "rails/ray/railtie"
require "ruby-ray"

module Rails
  module Ray

    module ActionControllerLogging
      extend ActiveSupport::Concern

      included do
        after_action :record_request_with_ray
      end

      def record_request_with_ray
        ray.to_json(
          url: request.url,
          response_code: response.code,
          ip_address: request.ip,
        )
      end
    end

    def self.start_active_record
      ActiveSupport::Notifications.subscribe "sql.active_record" do |name, started, finished, unique_id, data|
        ray.to_json(
          name: name,
          started: started,
          finished: finished,
          unique_id: unique_id,
          query: {
            name: data[:name],
            sql: data[:sql],
          }
        )
      end
    end

    def self.stop_active_record
      ActiveSupport::Notifications.unsubscribe "sql.active_record"
    end

  end
end

def with_active_record_logging(&block)
  Rails::Ray.start_active_record
  yield
  Rails::Ray.stop_active_record
end
