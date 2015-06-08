class Payload
  attr_accessor :topic, :payload

  def initialize(topic="", payload="")
    @topic, @payload = topic, payload
  end
end
