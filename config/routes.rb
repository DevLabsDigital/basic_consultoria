Rails.application.routes.draw do
  mount Consultoria::Engine => '/consultoria'
  get '/', to: 'consultoria#index', as: 'consulting'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
