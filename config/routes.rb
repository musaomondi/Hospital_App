Rails.application.routes.draw do
  scope "(:locale)", locale: /en/ do
    resources :users do
      member do
        get :change_password
        put :update_password
      end
    end
    root 'sessions#login'
    get 'login' => 'sessions#login'
    post 'login' => 'sessions#create'
    delete 'sign_out' => 'sessions#destroy'

    resources :patients  do
      member do
        get :generate_invoice
        resources :user_patients do
          member do
            get :fetch
          end
        end
      end
    end

    get 'reports' => "reports#reports"
    get 'my_reports' => "reports#my_reports"
    get 'fetchReports' => "reports#fetch_reports"
    get 'fetch_my_reports' => "reports#fetch_my_reports"
    get 'fetchReportsPdf' => "reports#fetch_reports_download"
    get 'searchPatients' => 'patients#searchPatients'
    get 'search' => 'patients#search'
    get 'downloadPdf' => 'patients#downloadPdf'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
end
