class Todo < ActiveRecord::Base
  default_scope -> { order(created_at: :desc) }
  belongs_to :user
  validates :todo_item, presence: true
  validates :start_date,presence: true
  validates :end_date,presence: true
  def done(params)
    
    @todo = Todo.find(params[:param1])
    # binding.pry
    if(@todo.completed==true)
      @todo.update_attribute(:completed, false)
    else
      @todo.update_attribute(:completed, true)
    end
    return @todo
  end

end
