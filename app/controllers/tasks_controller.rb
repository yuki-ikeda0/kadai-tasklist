class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @tasks = Task.find(params[:id])
  end

  def new
    @tasks = Task.new
  end

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

  def edit
     @tasks = Task.find(params[:id])

  end

  def update
     @tasks = Task.find(params[:id])

    if @task.update(message_params)
      flash[:success] = 'Message は正常に更新されました'
      redirect_to @tasks
    else
      flash.now[:danger] = 'Message は更新されませんでした'
      render :edit
    end
   
  end

  def destroy
    @tasks = Task.find(params[:id])
    @tasks.destroy

    flash[:success] = 'Message は正常に削除されました'
    redirect_to tasks_url
  end


private

  # Strong Parameter
  def message_params
    params.require(:task).permit(:content)
  end
end  