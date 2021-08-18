class CreateTrackers < ActiveRecord::Migration[6.1]
  def change
    create_table :trackers do |t|
      t.string :title
      t.string :patient

      t.timestamps
    end
  end
end
