Rails.application.routes.draw do
  devise_for :employees

  namespace :admin do
    resources :purchases
    get '/purchase/change_status/:id', as: :change_purchase_status, to: 'purchases#change_status'
  end
  resources :purchases, except: [:new, :create, :destroy]

  devise_scope :employee do
    get '/employees/sign_out' => 'devise/sessions#destroy'
  end
end
