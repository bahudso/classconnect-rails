class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :section
      t.references :teacher

      t.timestamps
    end
    add_index :courses, :teacher_id
  end
end
