class TodosController < ApplicationController
  def index
    @todo_items = Todo.all
    @new_todo = Todo.new
    render :index

  end

  def delete
  @last = Todo.last.destroy
 end
 def add
todo=   Todo.create(todo_params)
unless todo.valid?
  flash[:error] = todo.errors.full_messages.join("<br>").html_safe
else
  flash[:success]= "Todo added successfully"
end
   redirect_to :action => 'index'
 end
 def complete
   params[:todos_checkbox].each do |check|
       todo_id = check
       t = Todo.find_by_id(todo_id)
       t.update_attribute(:completed, true)
     end
    redirect_to :action => 'index'
 end


 private

   def todo_params
     params.require(:todo).permit(:todo_item)
   end
 end
