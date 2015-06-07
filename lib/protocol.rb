module Iris
  module MQTT
    class Protocol
      
      NAME = "MQTT"
      VERSION = "3"
      
      # Header
      CMD_SHIFT = 4
      CMD_MASK = 0xF0
      DUP_MASK = 0x08
      QOS_MASK = 0x03
      QOS_SHIFT = 1
      RETAIN_MASK = 0x01

      # Length
      LENGTH_MASK = 0x7F
      LENGTH_FIN_MASK = 0x80
      
      # QoS
      AT_MOST_ONCE = 0x00
      # Acknowledged deliver
    	AT_LEAST_ONCE = 0x01
    	# Assured Delivery
    	EXACTLY_ONCE = 0x02

      # Connect
      USERNAME_MASK = 0x80
      PASSWORD_MASK = 0x40
      WILL_TOPIC = 0x04
      WILL_RETAIN_MASK = 0x20
      WILL_QOS_MASK = 0x18
      WILL_QOS_SHIFT = 3
      WILL_FLAG_MASK = 0x04
      CLEAN_SESSION_MASK = 0x02
      
      # Connection responses
    	CONNECTION_ACCEPTED = 0x00
      CONNECTION_REFUSED_VERSION = 0x01
      CONNECTION_REFUSED_IDENTIFIER = 0x02
      CONNECTION_REFUSED_SERVER = 0x03
      CONNECTION_REFUSED_USER = 0x04
      CONNECTION_REFUSED_AUTH = 0x05
    	
    	SUBSCRIBE_SUCCESS_AT_MOST_ONCE = AT_MOST_ONCE
    	SUBSCRIBE_SUCCESS_AT_LEAST_ONCE = AT_LEAST_ONCE
    	SUBSCRIBE_SUCCESS_EXACTLY_ONCE = EXACTLY_ONCE
    	SUBSCRIBE_FAILURE = 0x80
    	
    	# Binary Packing/Unpacking # http://bit.ly/1vPz1pl
    	UINT8 = 'C' # 8-bit unsigned integer
    	UINT8STAR = 'C*' # * (un)packs all remaining bytes
    	
    end
  end
end