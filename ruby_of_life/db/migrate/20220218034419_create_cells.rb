class CreateCells < ActiveRecord::Migration[7.0]
  def change
    create_table :cells do |t|
      t.integer :game_id
      t.integer :x
      t.integer :y

      t.timestamps
    end
  end
end
