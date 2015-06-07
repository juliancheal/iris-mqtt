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

        def parse(buffer)
          # Create a new packet object
          bytes = buffer.unpack("C5")

          # Parse the packet length
          body_length = 0
          multiplier = 1
          pos = 1
          begin
            digit = bytes[pos]
            body_length += ((digit & 0x7F) * multiplier)
            multiplier *= 0x80
            pos += 1
          end while ((digit & 0x80) != 0x00) and pos <= 4

          # Delete the fixed header from the raw packet passed in
          buffer.slice!(0...pos)

          parse_body(buffer)
        end

        def parse_body(buffer)
          topic = shift_string(buffer)
          id = shift_short(buffer) unless qos == 0
          payload = buffer
        end

        # Remove a 16-bit unsigned integer from the front of buffer
        def shift_short(buffer)
          bytes = buffer.slice!(0..1)
          bytes.unpack('n').first
        end

        # Remove one byte from the front of the string
        def shift_byte(buffer)
          buffer.slice!(0...1).unpack('C').first
        end

        # Remove 8 bits from the front of buffer
        def shift_bits(buffer)
          buffer.slice!(0...1).unpack('b8').first.split('').map {|b| b == '1'}
        end

        # Remove n bytes from the front of buffer
        def shift_data(buffer,bytes)
          buffer.slice!(0...bytes)
        end

        # Remove string from the front of buffer
        def shift_string(buffer)
          len = shift_short(buffer)
          str = shift_data(buffer,len)
          # Strings in MQTT v3.1 are all UTF-8
          str.force_encoding('UTF-8')
        end


      end
    end
  end
end
