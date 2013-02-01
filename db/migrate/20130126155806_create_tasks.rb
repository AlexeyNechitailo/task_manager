class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.timestamp :deadline
      t.boolean :is_done, default: false
      t.references :project
      t.references :priority

      t.timestamps
    end
    add_index :tasks, :name
    add_index :tasks, :project_id
    add_index :tasks, :priority_id
  end
end
