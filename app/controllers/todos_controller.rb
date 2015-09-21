class TodosController < ApplicationController
  def index
    @todo_items = current_user.todos.all
    #@new_todo = Todo.new
    render :index
  end
  def new
    # @new_todo = Todo.new
  end




  def create

    @todo = current_user.todos.create(todo_params)
    # binding.pry
    if @todo.valid?
      flash.now[:success]= "Todo added successfully"
      redirect_to :action => 'index'
    else
      flash.now[:error] = @todo.errors.full_messages.join("<br>").html_safe
      render 'todos/new'
    end

  end

  def destroy
    @todo = Todo.find(params[:param1])
    @todo.destroy
    flash[:success] = "Todo deleted"
    redirect_to request.referrer || root_url
  end



  def complete
    @todo = Todo.find(params[:param1])
    if(@todo.completed==true)
      @todo.update_attribute(:completed, false)
    else
      @todo.update_attribute(:completed, true)
    end
    redirect_to :action => 'index'
 end

 def privateToDo
   @todo = Todo.find(params[:param1])
   if(@todo.private==true)
     @todo.update_attribute(:private, false)
   else
     @todo.update_attribute(:private, true)
   end
   redirect_to :action => 'index'
 end
 # def complete_handler
 #   @todo_items = current_user.todos.all
 #   render:complete
 #
 # end
 #  def complete
 #    params[:todos_checkbox].each do |check|
 #      todo_id = check
 #      t = Todo.find_by_id(todo_id)
 #      t.update_attribute(:completed, true)
 #    end
 #    redirect_to :action => 'index'
 # end


 # def privateToDo
 #   params[:todos_checkbox].each do |check|
 #     todo_id = check
 #     t = Todo.find_by_id(todo_id)
 #     if(t.private==false)
 #       t.update_attribute(:private, true)
 #     else
 #       t.update_attribute(:private, false)
 #     end
 #   end
 #   redirect_to :action => 'index'
 # end

 private
   def todo_params
      params.require(:todo).permit(:todo_item,:start_date,:end_date)
    end
 end
