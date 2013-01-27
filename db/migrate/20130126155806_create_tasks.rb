class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.date :deadline
      t.boolean :is_done
      t.references :project

      t.timestamps
    end
    add_index :tasks, :name
  end
end
