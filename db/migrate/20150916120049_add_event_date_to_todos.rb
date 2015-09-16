class AddEventDateToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :event_date, :date
    end
end
