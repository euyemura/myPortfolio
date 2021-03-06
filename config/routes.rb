Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  get 'portfolios/angular', to: 'portfolios#angular'
  get 'portfolios/rails', to: 'portfolios#rails'

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'mindful-news', to: 'pages#mindful_news'
  resources :topics, only: [:index, :show]

  resources :blogs do
    member do
      get :toggle_status
    end
  end

  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
end
