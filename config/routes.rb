Tracker::Application.routes.draw do
  
  resources :customers do
    resources :projects
  end
  
  devise_for :users

  root to: "dashboard#index"

end
