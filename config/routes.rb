Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    scope module: :v1, constraints: ApiConstraint.new(version: 1, default: true) do
      resources :posts, only: %i[show create update destroy index]
    end
  end
end
