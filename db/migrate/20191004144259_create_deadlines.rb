class CreateDeadlines < ActiveRecord::Migration[5.2]
  def change
    create_table :deadlines do |t|
      t.date :deadline

      t.timestamps
    end
  end
end
