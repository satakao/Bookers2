class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(resource) #divise専用のヘルパーメソッド：サインイン後にresourceにモデル（User）のインスタンス変数（データ）が引数として渡されてusers_showのルーティングを実行する
    users_show_path
  end
  
  def after_sign_out_path_for(resource)
    root_path
    
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end

