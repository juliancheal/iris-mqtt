require 'celluloid/io'

module Iris
  module MQTT
    class Shocket
      include Celluloid::IO
        finalizer :shutdown

      def initialize(host,port)
        @socket = TCPSocket.new(host,port)
        # async.read
      end

      def read
        loop do
          data = @socket.read
          process_data(data)
        end
      end

      def process_data(data)
        packet = Iris::MQTT::Packet.read(data)
        # puts "packet: #{packet}"
        # puts data.inspect
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
