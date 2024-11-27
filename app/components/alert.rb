class Alert < LittleWheels::Component
  def initialize(text:, variant: "primary")
    @text    = text
    @variant = variant
  end

  attr_reader :text, :variant

  TEMPLATE = <<-ERB
    <div class="alert alert-<%= c.variant %>" role="alert">
      <%= c.text %>
    </div>
  ERB
end