Rails.application.routes.draw do

  devise_for :employees
  # authenticate :employee, Proc.new {|e| e.admin?} do
    namespace :admin do
      resources :purchases
      get '/purchase/change_status/:id', as: :change_purchase_status, to: 'purchases#change_status'

    end
  # end

  resources :purchases, except: [:new, :create, :destroy]

end
