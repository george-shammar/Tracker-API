class CreateDays < ActiveRecord::Migration[6.1]
  def change
    create_table :days do |t|
      t.integer :blood_pressure
      t.integer :blood_sugar
      t.references :track, null: false, foreign_key: true

      t.timestamps
    end
  end
end
