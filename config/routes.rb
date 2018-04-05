Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :home
  resources :drivers

  resources :passengers do
    resources :trips, only: [:create, :show, :edit, :destroy, :update, :index]
  end


end
