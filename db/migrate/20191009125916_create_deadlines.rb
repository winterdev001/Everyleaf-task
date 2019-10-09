class CreateDeadlines < ActiveRecord::Migration[5.2]
  def change
    create_table :deadlines do |t|
      t.datetime :deadline
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
