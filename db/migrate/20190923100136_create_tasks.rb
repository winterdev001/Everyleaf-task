class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.string :label_name
      t.datetime :start_date
      t.datetime :end_date
      t.string :status
      
      t.timestamps
    end
  end
end
