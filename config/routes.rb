Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :members
  root 'homes#top'
  get 'homes/about' => 'homes#about', as: 'about'
end
