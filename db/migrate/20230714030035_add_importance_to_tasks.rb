class AddImportanceToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :importance, :integer, null: false, default: 0
  end
end