Rails.application.routes.draw do
  devise_for :users#デバイスライブラリを使用する際にURLとしてusersを含む
  root to:"homes#top"
  get "/home/about" => "homes#about" ,as: "home/about"


  resources :books, only: [:new, :create, :edit, :index, :show, :update, :destroy]#resourcesでbooksコントローラのルーティングを自動生成してくれる。onlyは[]内のもののみ生成したいとき
  resources :users, only: [:edit, :index, :new, :show, :update]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

