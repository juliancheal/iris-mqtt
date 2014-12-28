module Iris
  module MQTT
    module Message
      class Publish < Packet
        
        attr_accessor :duplicate, :retain, :qos, :topic, :payload

        def initialize(id=0, topic=nil, payload='', retain=false, qos=0)
          @id = id
          @topic = topic
          @payload = payload
          @retain = retain
          @qos = qos
          
          super(id: @id, topic: @topic, payload: @payload,
                retain: @retain, qos: @qos)
        end
        
        def type
          MessageType::PUBLISH
        end
        
        def variable_header
          body = ''
          if @topic.nil? or @topic.to_s.empty?
            raise "Invalid topic name when serialising packet"
          end
          body += encode_string(@topic)
          body += encode_short(@id) unless qos == 0
          body += payload.to_s.force_encoding('ASCII-8BIT')
          return body
        end
        
      end
    end
  end
end