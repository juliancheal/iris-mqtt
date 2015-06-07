module Iris
  module MQTT
    module Message
      class Subscribe < Packet

        attr_accessor :topics

        def initialize(id=0, topics=nil)
          @id = id
          @topics = []
          @topics << topics
          super(id: @id, topic: @topics)
        end
        
        def type
          MessageType::SUBSCRIBE
        end
        
        def variable_header
          if @topics.empty?
            raise "no topics given when serialising packet"
          end
          body = encode_short(@id)
          @topics.each do |topic|
            body += encode_string(topic)
            body += encode_bytes(0)
          end
          return body
        end
        
      end
    end
  end
end