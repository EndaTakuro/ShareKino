Rails.application.routes.draw do
  get 'homes/top'
  ActiveAdmin.routes(self)
  devise_for :members
  root 'homes#top'
end
