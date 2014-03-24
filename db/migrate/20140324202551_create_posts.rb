class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :poster_id, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.date :posted_at, null: false
      t.integer :interest_group_id, null: false

      t.timestamps
    end
  end
end
