class CreateAgency < ActiveRecord::Migration[7.0]
  def change
    create_table :agencies do |t|
      t.string :name, null: false
      t.string :code, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
