Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :doctors, only: [:show]
  delete '/doctors/:doctor_id/patients/:patient_id', to: 'doctor_patient#destroy'
end
