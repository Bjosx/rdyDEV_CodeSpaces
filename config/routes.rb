Rails.application.routes.draw do
  resources :students, only: [:index, :edit, :show, :update]

  #this is temporarily the default URL
  root to: 'students#index'
end
