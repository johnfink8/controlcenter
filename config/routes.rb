Controlcenter::Application.routes.draw do
  devise_for :users

  get "ec2_instance/list"
  resources :ec2_instance
  root :to => "home#index"
end
