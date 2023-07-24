# frozen_string_literal: true

Rails.application.routes.draw do
  resources :black_lists, only: %i[index create destroy]

  resources :students, only: %i[index create destroy] do
    resources :devices, only: %i[index create destroy]
  end

  resources :teachers, only: %i[index create destroy] do
    resources :devices, only: %i[index create destroy]
  end

  resource :lessons, only: %i[index create destroy]

  # task1: wecome_page페이지
  get '/', to: 'main#landing_page'
end
