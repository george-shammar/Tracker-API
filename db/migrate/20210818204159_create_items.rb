class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :blood_pressure
      t.integer :blood_sugar
      t.references :tracker, null: false, foreign_key: true

      t.timestamps
    end
  end
end
