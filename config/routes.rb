Rails.application.routes.draw do
  devise_for :users
  resources :users, :only => [:show, :edit, :update]
  root 'tops#index'
  resources :tops, :only => [:index]

  resources :stocks do
    collection do
    # 確認画面
      post :confirm
    end
  end

  resources :receipts do
    # コメント機能の実装
    resources :comments
    collection do
    # 確認画面
      post :confirm
    end
  end

  if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
