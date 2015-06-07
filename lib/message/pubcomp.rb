module Iris
  module MQTT
    module Message
      class Pubcomp < Packet

        def initialize(flags)
        end
        
        def type
          MessageType::PUBCOMP
        end
        
      end
    end
  end
end