Rails.application.routes.draw do
  devise_for :users
    resources :registered_applications

  get 'about' => 'welcome#about'

  root 'welcome#index'
  
  
end
