Rails.application.routes.draw do
  devise_for :users
  root to: "languages#index"

  resources :languages do
    resources :gatherings do
      resources :comments
    end
  end

  resources :languages do
    resources :lessons
  end

  resources :gatherings do
    member do
      post 'add_attendance'
      delete 'remove_attendance'
    end
  end

end
