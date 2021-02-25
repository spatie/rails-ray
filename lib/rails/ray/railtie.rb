module Rails
  module Ray
    class Railtie < ::Rails::Railtie
      initializer 'ray.action_controller' do
        ActiveSupport.on_load(:action_controller) do
          include ActionControllerLogging
        end
      end

      initializer 'ray.active_record' do
        Ray.start_active_record
      end

      initializer 'ray.active_job' do
        ActiveSupport::Notifications.subscribe "enqueue.active_job" do |name, started, finished, unique_id, data|
          job = data[:job]

          ray.to_json(
            adapter: data[:adapter].class.name,
            job: {
              name: job.class.name,
              arguments: job.arguments.map(&:to_s)
            }
          )
        end
      end
    end
  end
end
