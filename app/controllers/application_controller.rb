class ApplicationController < ActionController::Base
  # 未ログインでtopにリダイレクト
  #before_action :authenticate_user!, except: [:top]
  # devise
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resouce)
    user_path(current_user.id)
  end

  def after_sign_out_path_for(resouce)
    about_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
