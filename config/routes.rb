Rails.application.routes.draw do
  devise_for :members, controllers: {
    registrations: 'members/registrations'
  }
  devise_scope :member do
    post 'members/guest_sign_in', to: 'members/sessions#new_guest'
  end
  resources :movies, only: [:index, :show, :edit, :destroy] do
    resources :reviews, only: [:new, :create, :edit, :destroy, :update] do
      resource :favorites, only: [:create, :destroy]
    end
  end
  resources :members, only: [:show, :edit, :update, :destroy]
  get 'inquirys/new' => 'inquirys#new'
  post 'inquirys/confirm' => 'inquirys#confirm'
  post 'inquirys/done' => 'inquirys#done'
  devise_for :admin_users, ActiveAdmin::Devise.config
  root 'homes#top'
  ActiveAdmin.routes(self)

end
