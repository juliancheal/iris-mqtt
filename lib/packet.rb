module Iris
  module MQTT
    class Packet

      attr_accessor :version, :id, :body_length

      def initialize(options={})
      end

      def fixed_header
        header = [message_type]
      end

      def message_type
        self.type << Protocol::CMD_SHIFT
      end

      def variable_header
        ""
      end

      def payload
      end

      def parse(data)
      end

      def self.read(data)
        message = create_message_from_header(read_byte(data))
        message.parse(data)
      end

      def self.create_message_from_header(byte)
        type = ((byte & Protocol::CMD_MASK) >> Protocol::CMD_SHIFT)
        packet_class = Utilty.constantize("#{MessageType.by_value(type)}")

        # Create a new packet object
        packet_class.new({})
      end

      def self.read_byte(byte)
        byte.unpack(Protocol::UINT8).first
      end

      def write
        header = fixed_header
        # Call current Message's variable header
        body = self.variable_header

        # Check that that packet isn't too big
        body_length = body.bytesize
        if body_length > 268435455
          raise "Error serialising packet: body is more than 256MB"
        end

        header = set_remaining_size(body_length,header)

        # Convert header to binary and add on body
        header.pack(Protocol::UINT8STAR) + body
      end

      def set_remaining_size(body_length,header)
        begin
          digit = (body_length % 128)
          body_length = (body_length / 128)
          digit |= Protocol::LENGTH_FIN_MASK if (body_length > 0)
          header.push(digit)
        end while (body_length > 0)
        header
      end

      def encode_bytes(*bytes)
        bytes.pack('C*')
      end

      # Encode a 16-bit unsigned integer and return it
      def encode_short(val)
        [val.to_i].pack('n')
      end

      # Encode a UTF-8 string and return it
      # (preceded by the length of the string)
      def encode_string(str)
        str = str.to_s.encode('UTF-8')

        # Force to binary, when assembling the packet
        str.force_encoding('ASCII-8BIT')
        encode_short(str.bytesize) + str
      end

    end
  end
end
