class AddTaskRefToDeadlines < ActiveRecord::Migration[5.2]
  def change
    add_reference :deadlines, :task, foreign_key: true
  end
end
