Friends::Application.routes.draw do
  resources :locations
  resources :change_locations
  root :to => 'locations#index'
end
