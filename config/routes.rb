Rails.application.routes.draw do
 root "home#index"
 resources :workshops, only: [:index, :show]
end
