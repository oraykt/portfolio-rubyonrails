Rails.application.routes.draw do
  resources :topics, only: %i[index show]

  devise_for :users,
             path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               sign_up: 'register'
             }
  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end
  # get 'custom-endpoint', to: 'controller#custom_action'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  resources :blogs do
    member do
      get :toggle_status
    end
  end

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'tech-news', to: 'pages#tech_news'

  mount ActionCable.server => '/cable'

  get '/*404', to: 'pages#not_found'
  root to: 'pages#home'
end
