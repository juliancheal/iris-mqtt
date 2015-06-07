module Iris
  module MQTT
    module Message
      class Unsuback < Packet

        def initialize(flags)
        end
        
        def type
          MessageType::UNSUBACK
        end
        
      end
    end
  end
end