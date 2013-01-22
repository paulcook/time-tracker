Tracker::Application.routes.draw do
  
  resources :customers


  devise_for :users

  root to: "dashboard#index"

end
