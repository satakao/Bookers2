Rails.application.routes.draw do
  get "/homes/about" => "homes#about" ,as: "home/about"
  devise_for :users#デバイスライブラリを使用する際にURLとしてusersを含む
  resources :books, only: [:create, :edit, :index, :show, :destro]#resourcesでbooksコントローラのルーティングを自動生成してくれる。onlyは[]内のもののみ生成したいとき
  resources :users, only: [:edit, :index, :new, :show, :update]
  
  root to:"homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

