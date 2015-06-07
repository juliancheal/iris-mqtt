module Iris
  module MQTT
    module Message
      class Suback < Packet

        attr_accessor :return_codes
        
        def initialize(options={})
          default_options = {return_codes: []}
          options = default_options.merge(options)
          @return_codes = options[:return_codes]
        end
        
        def type
          MessageType::SUBACK
        end
        
        def parse(data)
          length = data.length;
          position = 0
          multiplier = 1
          body_length = 0
          bytes = data.unpack("C5")
          begin
            # digit = Packet.read_byte(data)
            digit = bytes[position]
            body_length += ((digit & 0x7F) * multiplier)
            multiplier *= 0x80
            position += 1
          end while ((digit & 0x80) != 0x00) and position <= 4
          
          parse_body(data)
        end
        
        # Parse the body (variable header and payload) of a packet
        def parse_body(buffer)
          @id = shift_short(buffer)
          while(buffer.bytesize>0)
            @return_codes << shift_byte(buffer)
          end
          # puts "subacks #{@return_codes.inspect}"
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