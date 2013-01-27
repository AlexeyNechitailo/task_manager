class CreatePriorities < ActiveRecord::Migration
  def change
    create_table :priorities do |t|
      t.string :name
      t.references :task
      
    end
    add_index :priorities, :name
  end
end
