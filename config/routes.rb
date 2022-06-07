Rails.application.routes.draw do
 root "home#index"
 resources :workshops, only: [:index, :show]
 resources :bookings, only: [:create] do 
    member do
        get :booking_details
    end
 end
end
