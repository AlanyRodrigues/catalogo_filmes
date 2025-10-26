Rails.application.routes.draw do
  devise_for :users
  root to: redirect('/users/sign_in')

  resources :movies do
    post 'create_comment', on: :member
  end
end

