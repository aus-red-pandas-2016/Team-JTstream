Rails.application.routes.draw do

  get '/appointments' => 'appointments#index', as: 'show_appointments'
  resources :feedbacks, only: [:new, :create, :destroy]
  resources :users do
    resources :appointments
  end

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  root :to => "appointments#index"
  resources :sessions

end
