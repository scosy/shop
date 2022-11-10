Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # config/routes.rb
  scope "/:locale" do
    resources :shops, only: %i[ create new show ]
  end

  # Defines the root path route ("/")
  root "shops#index"
end
