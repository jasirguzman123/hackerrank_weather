Rails.application.routes.draw do
  resource :weather, only: %i[create index]
  delete :erase, to: 'weathers#erase'
end
