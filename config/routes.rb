Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


resources :home
resources :drivers
resources :passengers
resources :trips

resources :passengers do
  resources :trips, only: [:index, :create]
end


end
