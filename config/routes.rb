Rails.application.routes.draw do
  root 'home#index'
  get '/signin', :to => 'sessions#new', :as => 'signin'
  get '/aboutus', :to => 'home#aboutus', :as => 'aboutus'
  post '/uploadfiles', :to => 'photos#upload', :as => 'uploadfiles'
  post '/items/:item_id/photos/create2', :to => 'photos#create2'
  get '/items/:item_id/photos/new2', :to => 'photos#new2'
  resources :home
  resources :items
  resources :items do
      resources :itemdetails
      resources :photos
  end
  resources :sessions, :only => [:new, :create, :destroy]
  #resources :items
  #resources :itemdetails
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
