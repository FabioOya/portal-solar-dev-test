Rails.application.routes.draw do
  root to: 'power_generators#index'
  resources :advanced_searches, only: %i[new create show]
  resources :power_generators, only: %i[index show] do
    resources :freights, only: %i[new create show] do
      get 'get_freight', on: :collection
    end
  end
  resources :home, only: %i[index show] do
    get 'search', on: :collection
  end
end
