class CreateMonsters < ActiveRecord::Migration
  def change
    create_table :monsters do |t|
      t.string :name
      t.integer :hit_points
      t.references :user, index: true
      t.integer :exp_gained
      t.integer :level
      t.integer :exp_yield
      t.integer :attack
      t.integer :defence
      t.integer :speed

      t.timestamps null: false
    end
    add_foreign_key :monsters, :users
  end
end
