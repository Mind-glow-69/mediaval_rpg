Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  if Rails.env.development?
    root to: redirect('/dev/mockups')
  end
  root to: redirect('/gm/dashboard') unless Rails.env.development?
  
  namespace :gm do
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    post 'logout', to: 'sessions#destroy'

    get 'dashboard', to: 'dashboard#index', as: :dashboard

    resources :quests do
      resources :steps, only: [:create, :update, :destroy]
    end

    resources :steps, only: [] do
      resources :riddles, only: [:create, :update, :destroy]
    end

    resources :npcs, only: [:index, :new, :create, :edit, :update, :destroy] do
      resources :moves, only: [:create, :update, :destroy]
    end

    resources :items
    get 'shop', to: 'shop#show'
    patch 'shop', to: 'shop#update'

    resources :players, only: [:index, :show, :update]
    get 'analytics', to: 'analytics#index'

    resources :assets do
      collection do
        get 'backgrounds'
        post 'backgrounds', to: 'assets#upload_background'
        delete 'backgrounds/:id', to: 'assets#destroy_background', as: :destroy_background
      end
    end
  end

  if Rails.env.development?
    namespace :dev do
      get 'mockups', to: 'mockups#index'
      get 'mockups/*name', to: 'mockups#show', as: 'mockup', format: false
    end
  end
end
