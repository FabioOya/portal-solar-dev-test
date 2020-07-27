Rails.application.routes.draw do
  root to: 'power_generators#index'
  resources :advanced_searches, only: %i[new create show]
  resources :home, only: %i[index show] do
    get 'search', on: :collection
  end
end
