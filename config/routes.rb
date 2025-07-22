Rails.application.routes.draw do
  root to: 'empresas#index'
  post '/integrar', to 'empresas#integrar', as: :integrar
end
