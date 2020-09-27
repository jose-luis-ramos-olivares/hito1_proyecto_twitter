Rails.application.routes.draw do
  resources :tweets do
    member do
      put "like" => "tweets#like"
    end
  end
  root 'tweets#index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
