Rails.application.routes.draw do
  root 'main#index'

  get 'fact' => 'factorial#fact'
  get 'balance' => 'balancing#balance'
  get 'find_numbers' => 'skip_numbers#find_numbers'
end
