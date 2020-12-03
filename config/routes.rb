Rails.application.routes.draw do
  devise_for :members
  resources :movies, only: [:index, :show, :edit, :destroy] do
    resources :reviews, only: [:new, :create, :edit, :destroy] do
      resource :favorites, only: [:create, :destroy]
    end
  end
  resources :members, only: [:show, :edit, :update, :destroy]
  devise_for :admin_users, ActiveAdmin::Devise.config
  root 'homes#top'
  get 'homes/about' => 'homes#about', as: 'about'
  ActiveAdmin.routes(self)

end
