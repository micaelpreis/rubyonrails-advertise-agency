Rails.application.routes.draw do

	# General
  post 'general/import_data', to: "general#import_data", as: "import_data"
  delete 'general/clean_data', to: "general#clean_data", as: "clean_data"

  # Campaigns
  resources :campaigns, only: [:index, :show]

  root 'general#index'
end
