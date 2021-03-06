Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :articles do
    collection do
      get :new
    end
    resources :comments
  end

  resources :user, :path => 'account', :as => 'account' do
    collection do
      get :register
      get :logout
    end
    resources :tweets
  end

  resources :tweets
  resources :home, controller: 'welcome'

  match '/account/:account_id/tweets' => 'tweets#index', :as => 'user_tweets', :via => [:get]
  match '/account/:account_id/tweets/:id' => 'tweets#destroy', :as => 'user_tweet', :via => [:delete]

  root 'welcome#index'
  
end
