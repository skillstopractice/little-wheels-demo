class LittleWheels::Preview < Lookbook::Preview
  def render(component, **locals)
    super(template: "little_wheels/component", locals: { c: component }.merge(locals))
  end
end
