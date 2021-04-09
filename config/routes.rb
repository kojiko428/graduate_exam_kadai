Rails.application.routes.draw do
  devise_for :users
  root 'stocks#index'
  resources :stocks do
    collection do
    # 確認画面
      post :confirm
    end
  end

  if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
