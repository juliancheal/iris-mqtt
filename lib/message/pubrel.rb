module Iris
  module MQTT
    module Message
      class Pubrel < Packet

        def initialize(flags)
        end
        
        def type
          MessageType::PUBREL
        end
        
      end
    end
  end
end