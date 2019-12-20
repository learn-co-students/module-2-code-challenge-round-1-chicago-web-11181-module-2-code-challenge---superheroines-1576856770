Rails.application.routes.draw do
  resources :powers, only: [:index, :show]
  resources :heroines, only: [:index, :show, :new, :create]
  root 'heroines#index'

  get 'index/flight', to: 'heroines#flight', as: 'heroines_flight'
  get 'index/strong', to: 'heroines#strong', as: 'heroines_strong'
  get 'index/supersense', to: 'heroines#supersense', as: 'heroines_supersense'
  get 'index/elastic', to: 'heroines#elastic', as: 'heroines_elastic'
end
