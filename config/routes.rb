Rails.application.routes.draw do

  namespace :admin do
    resources :purchases
  end
end
