class TodosController < ApplicationController

  def index
    @todos = Todo.all
  end

  def create
    data = params.require(:todo).permit(:description, :active, :completed).merge(active: true, completed: false)
    Todo.create data
    redirect_to root_url
  end

  def destroy
    id = params[:id]
    Todo.destroy id
    redirect_to root_url
  end


  def update
    id = params[:id]
    data = Todo.find(id)
    puts data
    if data.completed?
      data.update_attribute(:completed, false)
    else
      data.update_attribute(:completed, true)
    end
    redirect_to root_url
  end

end
