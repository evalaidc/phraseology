Rails.application.routes.draw do
  devise_for :users
  root to: "languages#index"

  resources :languages do
    resources :gatherings
  end

  resources :gatherings do
    member do
      post 'add_attendance'
      delete 'remove_attendance'
    end
  end

end
