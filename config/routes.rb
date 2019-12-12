Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  resources :people do
    resources :contacts
    resources :essays
    resources :specialisations
    resources :language_proficiencies
    resources :skills
    resources :qualifications
    resources :professional_memberships
  end

  resources :references
  resources :skill_types
  resources :employment_histories
  resources :fields
  resources :categories
  resources :sectors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
