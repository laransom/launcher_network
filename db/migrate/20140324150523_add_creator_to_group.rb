class AddCreatorToGroup < ActiveRecord::Migration
  def change
    add_column :interest_groups, :creator, :integer, null: false
  end
end
