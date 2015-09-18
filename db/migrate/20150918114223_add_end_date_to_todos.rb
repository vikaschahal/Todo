class AddEndDateToTodos < ActiveRecord::Migration
  def change
      add_column :todos, :end_date, :date
  end
end
