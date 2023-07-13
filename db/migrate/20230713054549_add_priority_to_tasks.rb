class AddPriorityToTasks < ActiveRecord::Migration[6.1]
  def change
    t.string "priority", null: false
  end
end
