class TaskappsController < ApplicationController
  before_action :set_message, only: []
  before_action :correct_user, only: [:destroy]
  before_action :require_user_logged_in
  
  def index
    #@taskapps = Taskapp.all.page(params[:page])
    if logged_in?
      @user = current_user
      @taskapps = current_user.taskapps.order('created_at DESC').page(params[:page])
    end
  end
#----
  def show
      @taskapp = current_user.taskapps.find_by(id: params[:id])
  end
#----
  def new
      @taskapp = current_user.taskapps.build 
  end
#----
  def create
      @taskapp = current_user.taskapps.build(taskapp_params)
      
    if @taskapp.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_url
    else
      @taskapp = current_user.microposts.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'taskapps/index'
    end
  end

  
#----
  def edit
    @taskapp = current_user.taskapps.find_by(id: params[:id])
  end
#----
  def update
    @taskapp = current_user.taskapps.find_by(id: params[:id])
      
    if @taskapp.update(taskapp_params)
      flash[:success] = 'Message は正常に更新されました。'
      redirect_to @taskapp
    else
      @taskapp = current_user.microposts.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'Message は更新されませんでした。'
      render :edit
    end
  end
#----

  def destroy
    @taskapp = current_user.taskapps.find_by(id: params[:id])
    @taskapp.destroy

    flash[:success] = 'Message は正常に削除されました'
    redirect_to taskapps_url
  end
#-----------------------------------------------------------------

private

 def set_message
   
  end
#----

  # Strong Parameter
   def taskapp_params
    params.require(:taskapp).permit(:content, :status)
  end
end
#----

def correct_user
    @taskapp = current_user.taskapps.find_by(id: params[:id])
    unless @taskapp
      redirect_to root_url
    end
  end

  
  
