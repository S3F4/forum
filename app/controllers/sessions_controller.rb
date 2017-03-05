class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by_username(params[:session][:username])

    if user && user.authenticate(params[:session][:password])
      login(user)
      redirect_to profile_path(user), notice: "Hoşgeldiniz sayın #{user.name}"
    else
      flash.now[:error] = "Kullanıcı adı veya parola hatalı"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Oturum Kapatıldı"
  end
end
