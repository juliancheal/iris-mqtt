module Iris
  module MQTT
    class Utilty

      def self.constantize(value)
        camel_cased_word = "Iris::MQTT::Message::#{value.capitalize}"
        names = camel_cased_word.split('::')
        names.shift if names.empty? || names.first.empty?

        constant = Object
        names.each do |name|
          constant = constant.const_defined?(name) ? constant.const_get(name) : constant.const_missing(name)
        end
        constant
      end
    end
end
end
