Rails.application.routes.draw do
  devise_for :users,
              path: '',
              path_names: {
                sign_in: 'login',
                sign_out: 'logout',
                registration: 'signup',
                omniauth_callbacks: 'users/omniauth_callbacks'
              },
              controllers: {
                sessions: 'users/sessions',
                registrations: 'users/registrations'
              }
  put '/update_password', to: 'users#update_password'
  resources :companies
  resources :tickets

  root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
