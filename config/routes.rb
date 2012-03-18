Blitter::Application.routes.draw do
  resources :bleats

  authenticated :user do
    root :to => 'bleats#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users, :only => :show
  match "/images/uploads/*path" => "gridfs#serve"
end
