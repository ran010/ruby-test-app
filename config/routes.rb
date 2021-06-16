Rails.application.routes.draw do

  namespace :admin do
    resources :purchases
  end

  resources :purchases, except: [:new, :create, :destroy]
end
