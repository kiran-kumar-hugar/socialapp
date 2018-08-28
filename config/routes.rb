Rails.application.routes.draw do
  get 'search', to: "home#search"
  get 'profile', to: "profiles#profile"
  get 'get-profile-content', to: "profiles#get_profile_content"

	get 'requests', to: "requests#requests"
  post 'requests/decide-request', to: "requests#decide"

  post 'send_request', to: "home#send_request", as: 'send_request'
  root to: "home#index"
  resources :feeds
  resources :groups
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
end
