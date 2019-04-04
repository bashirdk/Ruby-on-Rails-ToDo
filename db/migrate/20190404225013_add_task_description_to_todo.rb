class AddTaskDescriptionToTodo < ActiveRecord::Migration[5.1]
  def change
    add_column :todos, :task_description, :string
  end
end
