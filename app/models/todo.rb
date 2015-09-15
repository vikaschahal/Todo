class Todo < ActiveRecord::Base
#attr_accessible :todo_item
  belongs_to :user
  validates :todo_item, presence: true

end
