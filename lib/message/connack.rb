module Iris
  module MQTT
    module Message
      class Connack < Packet

        def initialize(flags)
          @connack_flags = [false, false, false, false, false, false, false, false]
        end

        def type
          MessageType::CONNACK
        end

        def parse(data)
          shift_byte(data)
          shift_byte(data)
          @return_code = shift_byte(data)
        end

        def return_msg
          case @return_code
            when 0x00
              "Connection Accepted"
            when 0x01
              "Connection refused: unacceptable protocol version"
            when 0x02
              "Connection refused: client identifier rejected"
            when 0x03
              "Connection refused: server unavailable"
            when 0x04
              "Connection refused: bad user name or password"
            when 0x05
              "Connection refused: not authorised"
            else
              "Connection refused: error code #{return_code}"
          end
        end

        # Remove one byte from the front of the string
        def shift_byte(buffer)
          buffer.slice!(0...1).unpack('C').first
        end

      end
    end
  end
end
