Rails.application.routes.draw do
  devise_for :users
    resources :registered_applications

  get 'welcome/about'
  
  get 'welcom/index'

  root 'welcome#index'
  
  
end
