Rails.application.routes.draw do
  get "/calculator", to: "calculator#interface"
  namespace :api do
    namespace :v1 do
      # resources :calculator do
      # end
      get '/calculators', to: 'calculator#index'
      post '/calculator', to: 'calculator#create'
      get '/calculator', to: 'calculator#show'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
