Rails.application.routes.draw do
  root to: 'power_generators#index'
  resources :freights, only: %i[new create show]
  resources :advanced_searches, only: %i[new create show]
  resources :power_generators, only: %i[index show]
  resources :home, only: %i[index show] do
    get 'search', on: :collection
  end
end
