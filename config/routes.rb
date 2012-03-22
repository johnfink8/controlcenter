Controlcenter::Application.routes.draw do
  get "ec2_instance/list"
  resources :ec2_instance
end
