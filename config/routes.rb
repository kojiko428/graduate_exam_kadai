Rails.application.routes.draw do
  resources :stocks do
    collection do
    # 確認画面
      post :confirm
    end
  end
end
