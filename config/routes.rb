Rails.application.routes.draw do
  root 'articles#index'

  #quando houver uma req nessa rota, redirecionar para controler articles action index
  get '/articles', to: 'articles#index'
end
