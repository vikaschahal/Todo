class UsersController < ApplicationController
  def index
    #@users=User.all
    @users=User.paginate(page: params[:page])
    # render :index
  end

  def show
  #  binding.pry
    @user=User.find(params[:id])
    @todos = @user.todos.all
    render :show
  end
end
