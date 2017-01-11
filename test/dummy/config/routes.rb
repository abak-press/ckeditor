Dummy::Application.routes.draw do
  resources :posts
  root :to => "posts#index"

  mount Ckeditor4::Engine => '/ckeditor'
end
