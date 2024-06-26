Rails.application.routes.draw do
  resources :todos do
    resources :items
  end

  post '/notify', to: 'notifications#notify'
  get '/notify', to: 'notifications#list'
  get '/help', to:'application#help'
end
