require 'spec_helper'
require 'rails_helper'
describe TodosController do
  include Devise::TestHelpers
  #  login_user
    render_views

  before(:each) do
      @user = User.create( email: "aaf@adfd.com", password: Devise.friendly_token )
      @todo= @user.todos.create(todo_item:"sample",start_date:"2015-09-11",end_date:"2015-09-14")
      sign_in @user
  end

  describe "#index" do
    it "list current user all todos" do
      # user = User.create( email: "aaf@adfd.com", password: Devise.friendly_token )

      # @user.stub_chain(:todos,:all).and_return(:todo)
      expect_any_instance_of(User).to receive_message_chain(:todos, :all).and_return([])

      # expect(@user.todos.all).to eq(:todo_items)
       get :index
      expect(response.status).to eq(200)
     expect(response).to render_template(:index)
    end
  end


  describe "#new", focus: true do
		it "send to new template" do
			get "new"
			expect(response.status).to eq(200)
      # expect(response).to render_template(:new)
		end
  end
  describe "#complete" do
    it "toggle the completed attribute of todo table" do      
      params={param1:@user.id}
      expect_any_instance_of(Todo).to receive(:done)
      
      post :complete,params
      expect(response.status).to eq(302)
      # response.should redirect_to 'todos/index'
      #  expect(response).to redirect_to('/todos/index')
      
    end
  end
  describe "#destroy" do
    it "destroy the selected todo from table" do
      params={param1:@todo.id}
        # expect_any_instance_of(Todo).to receive(:find).with(params)
      #  binding.pry
      # expect(:return_value).to be_instance_of(Todo)
        # expect_any_instance_of(Todo).to receive(:destroy)
      #  expect(controller).to set_flash[:success]
       delete :destroy,params
       expect(flash[:success]).to be_present
       expect(response.status).to eq(302)
    end
  end
	
    
end