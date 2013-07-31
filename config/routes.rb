Xmedit::Application.routes.draw do
  root to: "xml_files#index"

  resources :xml_files
end
