Beergame::Application.routes.draw do
  root to: 'games#index'

  resources :games, only: [:create, :show] do
    post :next_week, on: :member
  end

  resources :week_records, only: :update
end
