Rails.application.routes.draw do
  
  resources :items
  resources :photos
  resources :items do
	resources :itemdetails	
  end
  root 'items#index'
  #resources :items
  #resources :itemdetails
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
