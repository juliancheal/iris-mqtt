require 'test_helper'

describe Iris::MQTT::Packet do

  # Runs codes before each expectation
  before do
  end

  # Runs code after each expectation
  after do
  end
  
  let(:byte) {144}
  
  describe "Message from header" do
    it "Should equal Message" do
      packet = Iris::MQTT::Packet.create_message_from_header(byte)
      message = Iris::MQTT::Message::Suback.new({})
      packet.must_be_instance_of message.class
    end
    
    it "Wont equal Message" do
      packet = Iris::MQTT::Packet.create_message_from_header(byte)
      message = Iris::MQTT::Message::Disconnect.new({})
      packet.wont_be_instance_of message.class
    end
  end
end