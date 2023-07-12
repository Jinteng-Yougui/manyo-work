class ChangeColumnNullTasks < ActiveRecord::Migration[6.1]
  change_column :tasks, :title, :string, null: false
  change_column :tasks, :content, :text, null: false
end
