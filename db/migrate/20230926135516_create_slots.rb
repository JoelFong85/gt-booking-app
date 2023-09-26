class CreateSlots < ActiveRecord::Migration[7.0]
  def change
    create_table :slots do |t|
      t.string :time
      t.boolean :status
      t.integer :room_id

      t.timestamps
    end
  end
end
