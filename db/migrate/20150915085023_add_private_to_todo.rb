class AddPrivateToTodo < ActiveRecord::Migration
  def change
    add_column :todos, :private, :boolean,:default => false
  end
end
