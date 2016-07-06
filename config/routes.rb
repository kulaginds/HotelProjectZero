Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users, :path_names => {:sign_up => "register"}

  # root 'application#index'
  resources :hotels do
    resources :comments
  end

  namespace :api do
  	namespace :v1 do
  		resources :hotels, except: [:new, :edit]
  	end
  end

  root 'static_pages#home'
  match '/help', to: 'static_pages#help', via: 'get'
  match '/about', to: 'static_pages#about', via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/home', to: 'static_pages#home', via: 'get'

end
