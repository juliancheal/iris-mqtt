module Iris
  module MQTT
    module Message
      class Connect < Packet
        
        attr_accessor :mqtt_name, :mqtt_version, :clean_session, :keep_alive, :client_id, :username, :password, :will_topic, :will_payload, :will_qos, :will_retain
        
        def initialize(clean_session = true,
                        keep_alive = 30,
                        client_id = nil,
                        username = nil,
                        password = nil,
                        will_topic = nil,
                        will_payload = "",
                        will_qos = 0,
                        will_retain = false)
         @mqtt_name     = Protocol::NAME
         @mtqq_version  = Protocol::VERSION
         @clean_session = clean_session
         @keep_alive    = keep_alive
         @client_id     = client_id
         @username      = username
         @password      = password
         @will_topic    = will_topic
         @will_payload  = will_payload
         @will_qos      = will_qos
         @will_retain   = will_retain

         super(client_id: @client_id,
                clean_session: @clean_session,
                keep_alive: @keep_alive,
                will_topic: @will_topic,
                will_payload: @will_payload,
                will_qos: @will_qos,
                will_retain: @will_retain,
                username: @username,
                password: @password)
        end
        
        def type
          MessageType::CONNECT
        end
        
        def variable_header
          body = ''
          
          body += encode_string(@mqtt_name)
          body += encode_bytes(0x04)
          
          @flags = 0
          @flags |= Protocol::USERNAME_MASK unless @username.nil?
          @flags |= Protocol::PASSWORD_MASK unless @password.nil?
          @flags |= Protocol::WILL_RETAIN_MASK if @will_retain
          @flags |= ((@will_qos & Protocol::WILL_QOS_MASK) << Protocol::WILL_QOS_SHIFT)
          @flags |= Protocol::WILL_FLAG_MASK unless @will_topic.nil?
          @flags |= Protocol::WILL_TOPIC unless @will_topic.nil?
          @flags |= Protocol::CLEAN_SESSION_MASK if @clean_session
          
          body += encode_bytes(@flags)
          body += encode_short(@keep_alive)
          body += encode_string(@client_id)
          
          payload(body)
        end
        
        def payload(body)
          unless @will_topic.nil?
            body += encode_string(@will_topic)
            body += encode_string(@will_payload)
          end
          body += encode_string(@username) unless @username.nil?
          body += encode_string(@password) unless @password.nil?
          return body
        end
        
        def parse(data)
        end
        
      end
    end
  end
end