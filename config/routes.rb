Rails.application.routes.draw do
  devise_for :users, skip: [:registrations] 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_scope :user do
    authenticated :user do
      root 'home#index'
      post 'users', to: 'home#create_users'
      put 'users/:id/update', to: 'home#update_users'
      post 'formats', to: 'home#create_formats'
      put 'formats/:id/update', to: 'home#update_formats'
      get 'users_new', to: 'home#users_index'
      get 'formats_new', to: 'home#formats_index'
    end

    unauthenticated :user do
      root 'devise/sessions#new', as: :root_path
    end
  end
end 