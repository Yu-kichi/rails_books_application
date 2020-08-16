# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def index
    @users = User.all
    #@users = User.page(params[:page]).per(10)#マジックナンバーになる。。
    @time = Time.now
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: t("directory.flash.update")
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, alert: t("directory.flash.destroy")
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :name, :zip_code, :address, :introduction)
    end
end