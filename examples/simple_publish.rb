require "iris_mqtt"

client = Iris::MQTT::Client.connect('127.0.0.1:1883')

client.publish("greeting", "hello world!")