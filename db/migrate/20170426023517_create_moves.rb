class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.string :name
      t.integer :max_stamina
      t.integer :current_stamina
      t.integer :power
      t.references :monster, index: true

      t.timestamps null: false
    end
    add_foreign_key :moves, :monsters
  end
end
