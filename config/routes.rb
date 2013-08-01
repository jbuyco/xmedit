Xmedit::Application.routes.draw do
  root to: "pages#home"

  resources :documents, only: [:index, :edit, :create]
  resources :nodes, only: [:update, :create, :destroy]
  get "documents/:slug", to: "documents#show", as: "document", defaults: { format: "xml" }
end
