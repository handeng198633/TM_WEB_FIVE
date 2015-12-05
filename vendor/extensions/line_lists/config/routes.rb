Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :line_lists do
    resources :line_lists, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :line_lists, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :line_lists, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
