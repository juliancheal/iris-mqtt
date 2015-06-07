module Iris
  module MQTT
    module Message
      class Puback < Packet

        def initialize(flags)
        end
        
        def type
          MessageType::PUBACK
        end
        
      end
    end
  end
end