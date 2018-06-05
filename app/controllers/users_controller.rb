class UsersController < ApplicationController
   before_action :require_user_logged_in, only: [:index, :sh
  
  def index
    @users = User.all.page(params[:page])
    
  end

  def show
    @user = User.find(params[:id]) #Userモデルからユーザのみ抽出
  end

  def new
     @user = User.new #ユーザ登録用のフォーム
  end

  def create #ユーザ登録の処理
     @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
      #Users/showへ飛ばしshowアクションを実行
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
      
    end
  end
  
   private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
