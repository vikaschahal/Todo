class TodosController < ApplicationController
  def index
    @todo_items = current_user.todos.all
    #@new_todo = Todo.new
    render :index
  end
  def new
  @new_todo = Todo.new
  render :new
  end
  def delete
    @todo_item=current_user.todos.all
    render :delete
  end
  def destroy

    params[:todos_checkbox].each do |check|
      todo_id = check
      t = Todo.find_by_id(todo_id)
      t.destroy
    end
    redirect_to :action => 'index'
  end

  def add
    todo = current_user.todos.create(todo_params)
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


 def privateToDo
   params[:todos_checkbox].each do |check|
     todo_id = check
     t = Todo.find_by_id(todo_id)
     t.update_attribute(:private, true)
   end
   redirect_to :action => 'index'
 end

 private
   def todo_params
      params.require(:todo).permit(:todo_item,:event_date)
    end
 end
