Rails.application.routes.draw do
  get 'company_configurations/index'
  get 'company_configurations/show'
  get 'company_configurations/update'
  get 'company_configurations/create'
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
  get '/total_user_companies', to: 'user_companies#total_company'
  get '/total_tickets', to: 'tickets#total_ticket'
  get '/total_companies', to: 'companies#total_companies'
  resources :users, except: [:new, :create]
  resources :companies
  resources :company_configurations
  resources :tickets

  root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
