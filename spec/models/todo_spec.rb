require 'spec_helper'
require 'rails_helper'
describe Todo do
  before :all do
     DatabaseCleaner.clean_with(:truncation)     
   end
   before :each do
     @todo=Todo.create(todo_item: "sample list",start_date: "2015-09-02",end_date: "2015-09-01",completed: false,private: false)

   end
  it "should toggle completed attribute of table Todo" do
      params={param1:@todo.id}
    @todo1=  @todo.done(params)
    expect(@todo1.completed).to eq(true)
    end
    it "validate presence of todo_item" do
      @todo1=Todo.create(todo_item: " ")
       expect(@todo1).to be_invalid 
     end
end