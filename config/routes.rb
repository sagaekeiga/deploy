Rails.application.routes.draw do
  root 'pages#index'
  get 'pages/chart'
  resources :posts, only:[:create, :show, :new]

end
