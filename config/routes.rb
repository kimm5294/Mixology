Rails.application.routes.draw do

resources :users, except: [:index]

resources :drinks, only: [:create, :show, :index] do
  collection do
    get 'search'
    get 'display'
  end
end

resources :drinks_users, only: [:create, :destroy]

resources :sessions, only: [:destroy, :new, :create]

root 'drinks#index'

end
