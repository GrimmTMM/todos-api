Rails.application.routes.draw do
  resources :todos do
    resources :items
  end

  post '/auth/login', to: 'authentication#authenticate'
  post '/notify', to: 'notifications#notify'
  get '/notify', to: 'notifications#list'
  get '/help', to:'application#help'
  post '/signup', to: 'users#create'
end
