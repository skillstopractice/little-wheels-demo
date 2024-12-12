class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def sketch
    @name = "Gregory"

    lucky_number = rand(1..100)

    render :inline => TEMPLATE, :layout => :default, :locals => { :lucky_number => lucky_number }
  end

  TEMPLATE = <<~ERB
    <h1>Hello <%= @name %></h1>

    <p>Your lucky number is <%= lucky_number %></p>
  ERB
end
