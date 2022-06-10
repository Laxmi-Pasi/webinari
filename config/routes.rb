Rails.application.routes.draw do
  devise_for :admin_users, controllers: {
    sessions: 'admin_users/sessions',
    passwords: 'admin_users/passwords'
  }
  root "home#index"
  resources :workshops, only: [:index, :show]
  resources :bookings, only: [:create] do 
    member do
      get :booking_details
    end
  end

  namespace :admin do
    get 'dashboard' => 'dashboard#index'
  end

  resources :refunds do
    member do
      get :refund_details
      post :refund_details
    end
  end
end
