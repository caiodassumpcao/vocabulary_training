Rails.application.routes.draw do
  root "word#index"
  post "/word/check_answer", to: "word#check_answer"
end