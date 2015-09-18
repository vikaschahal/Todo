class FixColumnNameInTodos < ActiveRecord::Migration
  def change
    rename_column :todos, :event_date, :start_date
  end
end
