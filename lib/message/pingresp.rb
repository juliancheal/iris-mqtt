module Iris
  module MQTT
    module Message
      class Pingresp < Packet

        def initialize(flags)
        end
        
        def type
          MessageType::PINGRESP
        end
        
      end
    end
  end
end