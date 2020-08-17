# frozen_string_literal: true

Rails.application.routes.draw do
  scope "(:locale)", locale: /en|ja/ do
    root "books#index"
    resources :books
    devise_for :users, controllers: {
        registrations: 'users/registrations',#これいる？
     }
    resources :users, except: [:new,:create]
  end
end
