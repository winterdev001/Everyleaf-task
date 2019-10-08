class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :tasks, :end_date, :deadline 
  end
end
