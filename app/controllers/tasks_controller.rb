class TasksController < ApplicationController
   before_action :set_message, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks = Task.all
  end
#----
  def show
  
  end
#----
  def new
    @tasks = Task.new
  end
#----
  def create
       @tasks = Task.new(message_params)
       
    if @tasks.save
      flash[:success] = 'Message が正常に投稿されました'
      redirect_to @tasks
    else
      flash.now[:danger] = 'Message が投稿されませんでした'
      render :new
   end
  end
  
#----
  def edit
  end
#----
  def update
     @tasks = Task.find(params[:id])

    if @tasks.update(message_params)
      flash[:success] = 'Message は正常に更新されました'
      redirect_to @tasks
    else
      flash.now[:danger] = 'Message は更新されませんでした'
      render :edit
    end
  end
#----

  def destroy
 
    @tasks.destroy
    flash[:success] = 'Message は正常に削除されました'
    redirect_to tasks_url
  end
#----

private

 def set_message
    @tasks = Task.find(params[:id])
  end
#----

  # Strong Parameter
  def message_params
    params.require(:task).permit(:content, :status)
   # params.require(:task).permit(:status)
  end
end  
#----