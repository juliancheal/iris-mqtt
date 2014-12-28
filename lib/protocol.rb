module Iris
  module MQTT
    class Protocol
      
      NAME = "MQTT"
      VERSION = "3"
      
      # Header
      CMD_SHIFT = 4
      CMD_MASK = 0x0F
      DUP_MASK = 0x08
      QOS_MASK = 0x03
      QOS_SHIFT = 1
      RETAIN_MASK = 0x01

      # Length
      LENGTH_MASK = 0x7F
      LENGTH_FIN_MASK = 0x80

      # Connect
      USERNAME_MASK = 0x80
      PASSWORD_MASK = 0x40
      WILL_TOPIC = 0x04
      WILL_RETAIN_MASK = 0x20
      WILL_QOS_MASK = 0x18
      WILL_QOS_SHIFT = 3
      WILL_FLAG_MASK = 0x04
      CLEAN_SESSION_MASK = 0x02
  
    end
  end
end