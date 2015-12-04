Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :package_orders do
    resources :package_orders, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :package_orders, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :package_orders, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
