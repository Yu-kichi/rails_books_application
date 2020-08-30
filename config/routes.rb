# frozen_string_literal: true

Rails.application.routes.draw do
  
  scope "(:locale)", locale: /en|ja/ do
    root "books#index"
    resources :profiles
    resources :books do
      resource :user_books, only: [:create, :destroy]
    end

    devise_for :users, controllers: {
        registrations: "users/registrations", 
        sessions:      "users/sessions",
     }
    resources :users, except: [:new, :create]
  end
end
