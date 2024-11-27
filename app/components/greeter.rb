class Greeter < LittleWheels::Component
  def initialize(speaker:, greeting:)
    @speaker  = speaker
    @greeting = greeting
  end

  attr_reader :speaker, :greeting
end