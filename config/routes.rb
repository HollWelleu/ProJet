Rails.application.routes.draw do

    devise_for :users

    root 'home#welcome'

    resources :home do
        collection do
            get :welcome
            get :admin
        end
    end

    resources :projects do
        resources :tasks
    end
end
