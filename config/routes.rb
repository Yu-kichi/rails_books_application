# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/show'
  scope "(:locale)", locale: /en|ja/ do
    root "books#index"
    #devise_for :users
    resources :books

    devise_for :users, controllers: {
        registrations: 'users/registrations',
        sessions:      'users/sessions',
     }
    resources :users, except: [:new,:create]
  end
end
