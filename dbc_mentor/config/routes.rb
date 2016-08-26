Rails.application.routes.draw do
  
  get '/appointments' => 'appointments#index', as: 'show_appointments' 

  resources :users do 
    resources :appointments
  end
end
