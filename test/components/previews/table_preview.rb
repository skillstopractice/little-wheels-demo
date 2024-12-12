class TablePreview < LittleWheels::Preview
  # @notes
  # Hooray!
  #
  # This is a full paragraph.
  def simple
    render BootWheel.table \
      fields:      [ { label: "A", key: :a }, { label: "BBB", key: :b } ],
      items:       [{ :a => 1, :b => 223}, { :a => 3, :b => 5}],
      table_class: ["w-50"]
  end

  def complex
   render Ui::Table.new \
    style_props: [:bordered],

    fields: [{:key => :age,         :label => "Age",         :variant => :warning },
              {:key => :first_name,  :label => "Given Name",  :variant => :danger  },
              {:key => :last_name,   :label => "Family Name", :variant => :info    }],

    items: [{ age: 40, first_name: 'Dickerson', last_name: 'Macdonald' },
            { age: 21, first_name: 'Larsen', last_name: 'Shaw' },
            { age: 89, first_name: 'Geneva', last_name: 'Wilson' },
            { age: 38, first_name: 'Jami', last_name: 'Carney' }] * 24
  end
end
