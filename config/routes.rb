Rails.application.routes.draw do
  root 'pages#index'
  get 'pages/chart'
  get 'articles/ruppish_root'
  resources :posts, only:[:create, :show, :new]

end
