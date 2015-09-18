class TodosController < ApplicationController
  def index
    @todo_items = current_user.todos.all
    #@new_todo = Todo.new
    render :index
  end
  def new
  @new_todo = Todo.new
  end

  def complete_handler
    @todo_items = current_user.todos.all
    render:complete

  end


  def create
    @todo = current_user.todos.create(todo_params)
    if @todo.valid?
      flash[:success]= "Todo added successfully"

    else
      flash[:error] = todo.errors.full_messages.join("<br>").html_safe
    end
    redirect_to :action => 'index'
  end
  def destroy
    @todo = Todo.find(params[:param1])
    @todo.destroy
    flash[:success] = "Todo deleted"
    redirect_to request.referrer || root_url
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
