class CreateInterestGroups < ActiveRecord::Migration
  def change
    create_table :interest_groups do |t|
      t.string :name, null: false
      t.text :description

      t.timestamps
    end
  end
end
