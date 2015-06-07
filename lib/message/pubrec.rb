module Iris
  module MQTT
    module Message
      class Pubrec < Packet

        def initialize(flags)
        end
        
        def type
          MessageType::PUBREC
        end
        
      end
    end
  end
end