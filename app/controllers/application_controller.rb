class ApplicationController < ActionController::Base
  # 未ログインではtopとaboutのみアクセスできる
  before_action :authenticate_user!, except: [:top, :about]
  # devise
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resouce)
    user_path(current_user.id)
  end

  def after_sign_out_path_for(resouce)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
