class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit!)
    if @user.save
      #flash[:notice] = "Aramıza Hoş Geldin"
      #redirect_to @user
      redirect_to profile_path, notice: "Aramıza Hoşgeldin"
    else
      render :new
    end
  end

  def show
    @user = User.find_by_username(params[:id])
    @data = []

    if params[:sayfa]
      render layout: "profile", locals: {page: params[:sayfa]}
    else
      render layout: "profile", locals: {page: "Konular"}
    end
  end

  def edit
    @user = User.find_by_username(params[:id])
    render layout: 'profile'
  end

  def update
    @user = User.find_by_username(params[:id])

    update_params = user_params

    if update_params.has_key?(:password)
      update_params.delete([:password, :password_confirmation])
    end

    if @user.update(update_params)
      #flash[:notice] = "Profil bilgileriniz başarıyla güncellendi"
      redirect_to profile_path, notice: "Profil bilgileriniz başarıyla güncellendi"
      #redirect_to @user
    else
      render :edit, layout: 'profile'
    end
  end

  private
  def user_params
    params.require(:user).permit!
  end

  def destroy
    @user = User.find_by_username(params[:id])
    @user.destroy
    redirect_to '/'
  end

  #def select_user
  # @user = User.find_by_username(params[:id])
  #end
end
