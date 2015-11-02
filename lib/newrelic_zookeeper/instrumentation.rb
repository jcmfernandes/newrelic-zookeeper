require 'new_relic/agent/method_tracer'

DependencyDetection.defer do
  @name = :zookeeper

  depends_on do
    defined?(::Zookeeper) &&
      !NewRelic::Control.instance['disable_zookeeper'] &&
      ENV['NEWRELIC_ENABLE'].to_s !~ /false|off|no/i
  end

  executes do
    NewRelic::Agent.logger.info 'Installing ZooKeeper Instrumentation'
  end

  executes do
    require 'new_relic/agent/datastores'

    ::Zookeeper::Client.class_eval do
      def _send_to_new_relic(args, elapsed)
        if NewRelic::Control.instance["transaction_tracer.record_sql"] == "obfuscated"
          args = _obfuscate_args(args)
        end
        NewRelic::Agent::Datastores.notice_statement(args.inspect, elapsed)
      end

      def _obfuscate_args(args)
        args.inject({}) do |r, (k, _)|
          r.update(k => '?')
        end
      end
    end

    methods = [
      'get',
      'set',
      'get_children',
      'stat',
      'create',
      'delete',
      'get_acl',
      'set_acl'
    ]

    methods.each do |method_name|
      ::Zookeeper::Client.class_eval %Q{
        def call_#{method_name}_with_newrelic_trace(options = {})
          callback = proc do |result, metric, elapsed|
            _send_to_new_relic(options, elapsed)
          end

          NewRelic::Agent::Datastores.wrap('ZooKeeper', '#{method_name}', nil, callback) do
            call_#{method_name}_without_newrelic_trace options
          end
        end

        alias_method :call_#{method_name}_without_newrelic_trace, :#{method_name}
        alias_method :#{method_name}, :call_#{method_name}_with_newrelic_trace
      }
    end
  end
end
