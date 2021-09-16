# frozen_string_literal: true

Rails.application.routes.draw do
  root 'articles#index'

  resources :articles do
    get :demo_action
    resources :comments
  end
end
