class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.int :blood_pressure
      t.int :blood_glucose
      t.references :tracker, null: false, foreign_key: true

      t.timestamps
    end
  end
end
