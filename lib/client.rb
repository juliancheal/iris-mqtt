require 'celluloid/io'

module Iris
  module MQTT
    class Client
      include Celluloid::IO
      include Celluloid::Logger
      finalizer :disconect
      
      CLIENT_ID_PREFIX = "iris"
      
      attr_accessor :client_id, :clean_session
      
      def initialize(args)
        @clean_session = true
        @packet_id = 0
        @socket = TCPSocket.new("127.0.0.1", "1883")
      end
      
      def self.connect(*args, &block)
        client = Iris::MQTT::Client.new(*args)
        client.connect(&block)
        return client
      end
      
      def connect(clientid=nil)
        if @client_id.nil? || @client_id.empty?
          if @clean_session
            @client_id = generate_client_id
          end
        end
        
        packet = Iris::MQTT::Message::Connect.new(@clean_session,
                                                    @keep_alive,
                                                    @client_id)#,
                                                    # @username,
                                                    # @password,
                                                    # @will_topic,
                                                    # @will_payload,
                                                    # @will_qos,
                                                    # @will_retain)
        send_packet(packet)
        receive_connack
      end
      
      def publish(topic, payload='', retain=false, qos=0)
        packet = Iris::MQTT::Message::Publish.new(@packet_id.next,
                                                    topic,
                                                    payload,
                                                    retain,
                                                    qos)
        send_packet(packet)
      end
      
      private

      def receive_connack
      end
      
      def send_packet(data)
        packets = data.write
        info "Sending Packet #{packets}"
        @socket.write(packets)
      end
      
      def generate_client_id
        "#{CLIENT_ID_PREFIX}#{rand(100)}#{Time.now.nsec}"
      end
      
      def connected?
        (!@socket.nil?) && (!@socket.closed?)
      end
      
      def disconect(send_msg=true)
        if send_msg
          packet = Iris::MQTT::Message::Disconnect.new
          send_packet(packet)
        end
        @socket.close
        @socket = nil
      end
      
    end
  end
end
