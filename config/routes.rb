Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :home
  resources :drivers

  resources :passengers do

    post 'new_trip', to:'trips#create'
  end

  resources :trips, :except => [:index]


end
