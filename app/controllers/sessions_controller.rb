class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    # &&は取得したユーザが有効かどうかを決定する
    if user && user.authenticate(params[:session][:password])
      #ユーザーログイン後にユーザ情報のページにリダイレクト
      log_in user
      redirect_to user
    else
      #エラーメッセージを作成
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  end
end
