require "celluloid/autostart"

module Iris
  module MQTT
    class Observer
      include Celluloid, Celluloid::Notifications

      execute_block_on_receiver :subscriber

      def subscriber(topic, &block)
        @subscribe_callback = block
        subscribe(topic, :on_message)
      end

      def on_message(*args)
        @subscribe_callback.call(args)
      end

    end
  end
end
