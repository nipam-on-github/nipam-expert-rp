Rails.application.routes.draw do
  root 'home#index'
  resources :people do
    resources :contacts
    resources :essays
    resources :specialisations
    resources :language_proficiencies
    resources :skills
    resources :qualifications
    resources :professional_memberships
    resources :references
    resources :employment_histories
    resources :user_categories
    resources :assignments
  end

  resources :skill_types
  resources :fields
  resources :categories
  resources :sectors
  
  resources :all_qualifications
  resources :all_specialisations
  resources :all_skills
  resources :all_professional_memberships
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  
  resources :registers

  get 'new', to: 'registers#new', as: 'new'
  
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'cities/:state', to: 'application#cities'

  resources :register_names, only: %i[new create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
