class ChangeDeadlineColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :deadlines, :deadline,:datetime
  end
end
