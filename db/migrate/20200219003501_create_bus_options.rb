class CreateBusOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :bus_options do |t|
      t.references :bus, null: false, foreign_key: true
      t.references :option, null: false, foreign_key: true

      t.timestamps
    end
  end
end
