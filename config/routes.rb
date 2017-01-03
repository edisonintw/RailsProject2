Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homepage#index'

  resources :users do
    resources :comments

    collection do
      post 'login'
      get 'logout'
    end
  end
end

