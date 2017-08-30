Rails.application.routes.draw do
  devise_for :users
  namespace :v1, defaults: { format: :json } do
    scope ':account_id' do
      resources :contacts, only: %i[index]

      resources :organizations, only: %i[create update] do
        resources :contacts, only: %i[create update destroy]
      end
    end

    resources :accounts, only: [:index, :create, :update]
    resource :sessions, only: [:create, :destroy]
    resources :users, only: [:create]
  end
end
