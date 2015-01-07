require 'test_helper'

describe Iris::MQTT::MessageType do

  # Runs codes before each expectation
  before do
  end

  # Runs code after each expectation
  after do
  end
    
  it "should be a Connack Message" do
    type = Iris::MQTT::MessageType::CONNACK
    message = Iris::MQTT::Message::Connack.new({})
    type.must_equal message.type
  end
  
  it "should be a Connect Message" do
    type = Iris::MQTT::MessageType::CONNECT
    message = Iris::MQTT::Message::Connect.new({})
    type.must_equal message.type
  end
  
  it "should be a Disconnect Message" do
    type = Iris::MQTT::MessageType::DISCONNECT
    message = Iris::MQTT::Message::Disconnect.new({})
    type.must_equal message.type
  end
  
  it "should be a Pingreq Message" do
    type = Iris::MQTT::MessageType::PINGREQ
    message = Iris::MQTT::Message::Pingreq.new({})
    type.must_equal message.type
  end
  
  it "should be a Pingresp Message" do
    type = Iris::MQTT::MessageType::PINGRESP
    message = Iris::MQTT::Message::Pingresp.new({})
    type.must_equal message.type
  end
  
  it "should be a Puback Message" do
    type = Iris::MQTT::MessageType::PUBACK
    message = Iris::MQTT::Message::Puback.new({})
    type.must_equal message.type
  end
  
  it "should be a Pubcomp Message" do
    type = Iris::MQTT::MessageType::PUBCOMP
    message = Iris::MQTT::Message::Pubcomp.new({})
    type.must_equal message.type
  end
  
  it "should be a Publish Message" do
    type = Iris::MQTT::MessageType::PUBLISH
    message = Iris::MQTT::Message::Publish.new({})
    type.must_equal message.type
  end
  
  it "should be a Pubrec Message" do
    type = Iris::MQTT::MessageType::PUBREC
    message = Iris::MQTT::Message::Pubrec.new({})
    type.must_equal message.type
  end
  
  it "should be a Pubrel Message" do
    type = Iris::MQTT::MessageType::PUBREL
    message = Iris::MQTT::Message::Pubrel.new({})
    type.must_equal message.type
  end
  
  it "should be a Suback Message" do
    type = Iris::MQTT::MessageType::SUBACK
    message = Iris::MQTT::Message::Suback.new({})
    type.must_equal message.type
  end
  
  it "should be a Unsuback Message" do
    type = Iris::MQTT::MessageType::UNSUBACK
    message = Iris::MQTT::Message::Unsuback.new({})
    type.must_equal message.type
  end
  
  it "should be a Unsubscribe Message" do
    type = Iris::MQTT::MessageType::UNSUBSCRIBE
    message = Iris::MQTT::Message::Unsubscribe.new({})
    type.must_equal message.type
  end
end