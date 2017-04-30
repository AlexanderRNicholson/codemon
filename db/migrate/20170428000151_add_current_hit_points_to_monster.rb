class AddCurrentHitPointsToMonster < ActiveRecord::Migration
  def change
    add_column :monsters, :current_hit_points, :integer
  end
end
