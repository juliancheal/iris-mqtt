module Iris
  module MQTT
    module Message
      class Disconnect < Packet

        def initialize
        end
        
        def type
          MessageType::DISCONNECT
        end
        
      end
    end
  end
end