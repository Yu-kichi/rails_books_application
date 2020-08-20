# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # add_flash_types :success, :info, :warning, :danger
  before_action :authenticate_user!, except: [:index, :show]
  # deviseコントローラーにストロングパラメータを追加する
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      # サインアップ時にnameのストロングパラメータを追加
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      # アカウント編集の時にnameのストロングパラメータを追加
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :id])
    end
end
