module Iris
  module MQTT
    module Message
      class Pingreq < Packet

        def initialize(flags)
        end
        
        def type
          MessageType::PINGREQ
        end
        
      end
    end
  end
end