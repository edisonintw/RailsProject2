Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homepage#index'

  get 'german_lessons', to: 'lessons#german'

  resources :posts do
    resources :comments
  end

  resources :users do

    collection do
      post 'login'
      get 'logout'
    end
  end
end

