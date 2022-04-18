Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'schedules/index'
      get 'schedules/yotei', to: 'schedules#yotei'
      post 'schedules/create'
      # post 'schedules/update'
      post 'schedules/delete'

    end
  end
end
