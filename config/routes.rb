Rails.application.routes.draw do

resources :users, except: [:index]

resources :drinks, only: [:create, :show] do
  collection do
    get 'search'
    post 'search_post'
  end
end

resources :drinks_users, only: [:create, :destroy]

resources :sessions, only: [:destroy, :new]

end
