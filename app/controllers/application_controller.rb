class ApplicationController < ActionController::Base
  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    user_path(resource.id)
  end

  # usernameを登録できるようにする
  protect_from_forgery with: :exception
   before_action :configure_permitted_parameters, if: :devise_controller?

   protected

   def configure_permitted_parameters
     added_attrs = [ :email, :username, :password, :password_confirmation, :image ]
     devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
     devise_parameter_sanitizer.permit :account_update, keys: added_attrs
     devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
   end

   #(UserController)ログインユーザーが別ユーザーのマイページに行かないよう制限
   def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
  end
end
