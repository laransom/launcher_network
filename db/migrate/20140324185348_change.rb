class Change < ActiveRecord::Migration
  def up
    remove_column :interest_groups, :creator
    add_column :interest_groups, :creator_id, :integer
  end

  def down
    add_column :interest_groups, :creator, :integer
    remove_column :interest_groups, :creator_id
  end
end
