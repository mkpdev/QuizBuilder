# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  # You can have the root of your site routed with "root"
  root to: 'quizzes#index'

  resources :quizzes do
    collection do
      get :quiz_result
    end
    resources :questions do
      resources :answers
    end
  end
end
