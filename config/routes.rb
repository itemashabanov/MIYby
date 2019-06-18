Rails.application.routes.draw do
  resources :specialties
  get 'admin' => 'admin#index'
  get 'disciplines/dsearch'
  get 'groups/dsearch'
  get 'disciplines/ddsearch'
  get 'groups/groupsearch'
  get 'disciplines/dddsearch'
  get 'disciplines/find_semester'
  get 'teaching_materials/tsearch'
  get 'teaching_materials/ttsearch'
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :users
  root 'client#index', as: 'client_index'
  resources :teaching_materials
  resources :disciplines
  resources :groups
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end




# call me by +375444721613 if you read it, i wanna know who are you   !!!!!!!!!!!!!!!!!!!!!!!!!!!
