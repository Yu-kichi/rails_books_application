class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[show edit update destroy]
  before_action :set_locale
  before_action :honnin?, only: %i[edit update destroy]
  # skip_before_action :authenticate_user!, only: :show これで書き方はあってることを確認。

  def index
    @profiles = Profile.page(params[:page]).per(10)#マジックナンバーになる。。
    @time = Time.now
  end
  
  def show
  end
  
  def new
    @profile = Profile.new
  end
  
  def create
     @profile = Profile.new(profile_params)
     #@profile = current_user.profiles.new(profile_params)
     if @profile.save
       redirect_to @profile, notice: t("directory.flash.create")
     else
       render :new
     end
  end

  def edit
    #@profile = Profile.find(params[:id])
    # redirect_to(root_url) unless @profile == current_profile
  end

  def update
    if @profile.update(profile_params)
      redirect_to @profile, notice: t("directory.flash.update")
    else
      render :edit
    end
  end
  # 一応作っとくが管理者以外使えないようにする。
  def destroy
    @profile.destroy
    redirect_to profiles_url, alert: t("directory.flash.destroy")
  end

  private
    def honnin?
      # redirect_to root_url,notice: t("directory.flash.update") unless @profile == current_profile
      #redirect_to root_url, alert: "本人以外はできません" unless @profile == current_profile # これでdestroyもリダイレクトできる。
    end
    def set_profile
      #@profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:name, :zip_code, :address, :introduction)
    end
end
