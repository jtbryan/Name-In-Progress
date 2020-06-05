Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :articles do
    resources :comments
  end

  resources :tweets
  resources :user

  resources :welcome

  root 'welcome#index'
  
end
