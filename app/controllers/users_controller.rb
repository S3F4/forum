class UsersController < ApplicationController

  before_action :select_user, only: [:show, :edit, :update, :destroy]
  before_action :allowed?, only: [:edit, :create, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit!)
    if @user.save
      login(@user)
      #flash[:notice] = "Aramıza Hoş Geldin"
      #redirect_to @user
      redirect_to profile_path(@user), notice: "Aramıza Hoşgeldin"
    else
      render :new
    end
  end

  def show
    @user = User.find_by_username(params[:id])
    if @user
      @data = []

      sayfa = params[:sayfa] || 'Konular'

      if sayfa == 'Konular'
        @data = @user.topics
      else
        @data = []
      end
      #if params[:sayfa]
      #  render layout: "profile", locals: {page: params[:sayfa]}
      #else
      #  render layout: "profile", locals: {page: "Konular"}
      #end

      render layout: "profile", locals: {page: sayfa}

    else
      redirect_to "/"
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

  def destroy
    @user = User.find_by_username(params[:id])
    @user.destroy
    redirect_to '/'
  end

  private
  def user_params
    params.require(:user).permit!
  end


  def select_user
    @user = User.find_by_username(params[:id])
  end

  private
  def allowed?
    user = select_user
    unless current_user == user
      redirect_to profile_path(user), alert: "Bunu yapmaya yetkiniz yok"
    end
  end
end
