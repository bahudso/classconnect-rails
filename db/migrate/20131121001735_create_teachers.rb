class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.integer :id
      t.string :name
      t.string :department

      t.timestamps
    end
  end
end
