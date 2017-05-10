Rails.application.routes.draw do
  root 'pages#index'
  get 'pages/chart'
  get 'articles/ruppish_root'
  resources :posts, only:[:create, :show, :new]
  resources :bots, only: [:create, :index, :new]
  get 'bots/crawl', to: 'bots#crawl'
  get 'bots/if_crawl', to: 'bots#if_crawl'
  get 'bots/slice_crawl', to: 'bots#slice_crawl'


end
