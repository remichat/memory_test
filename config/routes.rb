Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'country_revenues#show'
  get '/country_revenues/:country', to: 'country_revenues#show'
end
