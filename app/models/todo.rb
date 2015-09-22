class Todo < ActiveRecord::Base
  default_scope -> { order(created_at: :desc) }
  belongs_to :user
  validates :todo_item, presence: true
  validates :start_date,presence: true
  validates :end_date,presence: true

end
