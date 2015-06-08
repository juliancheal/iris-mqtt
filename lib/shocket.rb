require 'celluloid/io'
require "celluloid/autostart"

module Iris
  module MQTT
    class Shocket
      include Celluloid, Celluloid::IO, Celluloid::Notifications
        finalizer :shutdown

      def initialize(host="127.0.0.1",port="1883")
        @socket = TCPSocket.new(host,port)
      end

      def read
        loop do
          data = @socket.read
          daata = process_data(data)
          topic = daata.topic rescue ""
          payload = daata.payload rescue ""
          publish(topic, payload)
        end
      end

      def process_data(data)
        packet = Iris::MQTT::Packet.read(data)
      end

      def write(msg)
        @socket.write(msg)
      end

      def shutdown
        @server.close if @server
      end

    end
  end
end
