Rails.application.routes.draw do
  root 'homes#top'
  get 'homes/about' => 'homes#about', as: 'about'
  ActiveAdmin.routes(self)
  devise_for :members
end
