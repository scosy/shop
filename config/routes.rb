Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # config/routes.rb
  scope "/:locale" do
    resources :shop, only: :show
  end
  
  # Defines the root path route ("/")
  root "shop#index"  
end
