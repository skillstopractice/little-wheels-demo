class TablePreview < Lookbook::Preview
  def simple
    table = Ui::Table.new(
      style_props: [:bordered],

      fields: [{:key => :age,         :label => "Age",         :variant => :warning },
               {:key => :first_name,  :label => "Given Name",  :variant => :danger  },
               {:key => :last_name,   :label => "Family Name", :variant => :info    }],

      items: [{ age: 40, first_name: 'Dickerson', last_name: 'Macdonald' },
              { age: 21, first_name: 'Larsen', last_name: 'Shaw' },
              { age: 89, first_name: 'Geneva', last_name: 'Wilson' },
              { age: 38, first_name: 'Jami', last_name: 'Carney' }] )

    render_with_template(template: "table_preview/simple", :locals => { table: table})
  end
end