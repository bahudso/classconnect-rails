class CreatePosts < ActiveRecord::Migration
  def change
    drop_table :posts
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.references :course

      t.timestamps
    end
    add_index :posts, :course_id
  end
end
