# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  get  '/share', to: 'sharing#new'
  post '/share', to: 'sharing#create'
end
