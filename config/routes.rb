Rails.application.routes.draw do
  constraints format: :json do
    post :weather, to: 'weathers#create'
    get :weather, to: 'weathers#index'
    delete :erase, to: 'weathers#erase'
  end
end
