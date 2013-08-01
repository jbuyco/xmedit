Xmedit::Application.routes.draw do
  root to: "pages#home"

  resources :documents, except: :show
  resources :nodes
  get "documents/:slug", to: "documents#show", as: "document", defaults: { format: "xml" }
end
