class CreateTaskTimes < ActiveRecord::Migration
  def change
    create_table :task_times do |t|
      t.references :task
      t.references :user
      t.datetime :started_at
      t.datetime :stopped_at
      t.integer :total_time
      t.timestamps
    end
    add_index :task_times, :task_id
    add_index :task_times, :user_id
  end
end
