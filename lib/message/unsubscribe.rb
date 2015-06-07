module Iris
  module MQTT
    module Message
      class Unsubscribe < Packet

        def initialize(flags)
        end
        
        def type
          MessageType::UNSUBSCRIBE
        end
        
      end
    end
  end
end