Rails.application.routes.draw do

  devise_for :employees
  namespace :admin do
    resources :purchases
  end

  resources :purchases, except: [:new, :create, :destroy]
end
