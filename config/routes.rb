Rails.application.routes.draw do

  resources :documents do
  post 'revert', :on => :member
  get 'list_versions', :on => :member
end

  resources :document_types do
  post 'revert', :on => :member
  get 'list_versions', :on => :member
end

  resources :products do
  post 'revert', :on => :member
  get 'list_versions', :on => :member
end

  resources :work_processes do
  post 'revert', :on => :member
  get 'list_versions', :on => :member
end

  resources :processes do
  post 'revert', :on => :member
  get 'list_versions', :on => :member
end

  root to: 'clients#index'

  # Inline_forms
  resources :clients do
    post 'revert', :on => :member
    get 'list_versions', :on => :member
  end

  resources :inline_forms_translations do
    post 'revert', :on => :member
    get 'list_versions', :on => :member
  end

  resources :inline_forms_keys do
    post 'revert', :on => :member
    get 'list_versions', :on => :member
  end

  resources :inline_forms_locales do
    post 'revert', :on => :member
    get 'list_versions', :on => :member
  end

  mount Ckeditor::Engine => '/ckeditor'
  resources :roles do
    post 'revert', :on => :member
    get 'list_versions', :on => :member
  end

  resources :locales do
    post 'revert', :on => :member
    get 'list_versions', :on => :member
  end

  devise_for :users, :path_prefix => 'auth'
  resources :users do
    post 'revert', :on => :member
    get 'list_versions', :on => :member
  end
end
