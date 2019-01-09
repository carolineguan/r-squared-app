Rails.application.routes.draw do

# For styled pages
  root 'login#index'

  get 'sessions/new'
  get 'app/views/login/index.html.erb', to: 'login#index', as: 'login'
  get 'app/views/home/index.html.erb', to: 'home#index', as: 'home'
  get 'app/views/advancedsearch/index.html.erb', to: 'advancedsearch#index', as: 'advancedsearch'
  get 'app/views/browsingsearch/index.html.erb', to: 'browsingsearch#index', as: 'browsingsearch'

  get    '/rooms',   to: 'rooms#index'
  get    '/bright',   to: 'bright#index'
  get    '/rdmc',       to: 'rdmc#index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

   resources :home
   resources :login
   resources :advancedsearch
   resources :browsingsearch
   resources :user, :bookings, :rooms
   resources :sessions
end
