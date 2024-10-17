Rails.application.routes.draw do
<<<<<<< HEAD
  resources :students
=======
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
>>>>>>> a1b933c0137bb29b8215aeb933d0f80dc32aaa48

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
<<<<<<< HEAD
  root "students#index"
end
=======
  # root "posts#index"
end
>>>>>>> a1b933c0137bb29b8215aeb933d0f80dc32aaa48
