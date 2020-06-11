Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :articles do
    resources :comments
  end

  resources :user, :path => 'account', :as => 'account' do
    collection do
      get :register
    end
    resources :tweets
  end

  resources :tweets
  resources :home, controller: 'welcome'

  root 'welcome#index'
  
end
