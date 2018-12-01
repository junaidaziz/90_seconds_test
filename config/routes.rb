Rails.application.routes.draw do
  get '/students' => 'application#students'
  get '/stats' => 'application#stats'
end
