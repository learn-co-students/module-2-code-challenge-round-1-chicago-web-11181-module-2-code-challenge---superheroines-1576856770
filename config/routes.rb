Rails.application.routes.draw do
  # get '/search_by_superpower', action: :index_search_by_superpower, controller: 'heroines'
  # line 2 got commented out, ran out of time
  # was able to define route for bonus deliverable
  # was able to tie it to an action in its respective controller
  resources :powers
  resources :heroines 
end
