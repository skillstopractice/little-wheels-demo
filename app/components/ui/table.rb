class Ui::Table
  include LittleWheels::Component

  def initialize(items:, style_props: [], fields: items.first.keys)
    @items       = items
    @style_props = style_props
    @fields      = normalize_fields(fields)
  end

  attr_reader :items, :fields

  def applied_classes
    helpers.class_names(["table"] + @style_props.map { |e| "table-#{e}"})
  end

  def normalize_fields(fields)
    item_keys = @items.first.keys

    fields.map.with_index do |e,i|
      Hash === e ? e : { key: item_keys[i], label: e }
    end
  end

  def field_with_key(key)
    @fields.find { |e| e[:key] == key }
  end

  TEMPLATE = <<-ERB
    <table class="<%= c.applied_classes %>">
      <thead>
        <tr>
          <% c.fields.each do |field| %>
            <% if field[:variant] %>
              <th scope="col" class="table-<%= field[:variant] %>"><%= field[:label] %></th>
            <% else %>
              <th scope="col"><%= field[:label] %></th>
            <% end %>
          <% end %>
        </tr>
      </thead>
      <tbody>
        <% c.items.each do |item| %>
          <tr>
            <% item.each do |key, value| %>
              <% if c.field_with_key(key)[:variant] %>
                <td class="table-<%= c.field_with_key(key)[:variant] %>"><%= value %></td>
              <% else %>
                <td><%= value %></td>
              <% end %>
            <% end %>
          </tr>
        <% end %>
      </tbody>
    </table>
  ERB
end
