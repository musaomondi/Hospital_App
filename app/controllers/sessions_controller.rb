#Session management controller for the application.

class SessionsController < ApplicationController

  #Action to render index page of the application.
  def login
    @page_name = SessionsHelper::LOGIN;
  end
  def new_pat
    @page_name = SessionsHelper::LOGIN;
  end

  #Action to create session for the user if authentication succeeds.
  def create
    user = User.authenticate(params[:session][:email_id], params[:session][:password])
    if user
      reset_session
      sign_in(user)
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'login'
    end
  end
  def createpat
    patient = Patient.find_by(email_id: params[:session][:email_id].downcase) 
    if patient && patient.authenticate(params[:session][:password]) 
        logg_in(patient)
        redirect_to patient
    else
      flash.now[:danger] = "Invalid email/password combination"
      render 'new_pat'
    end
    # patient = Patient.authenticate(params[:session][:email_id], params[:session][:password])
    # if patient
    #   logg_in(patient)
    #   redirect_to patient
    # else
    #   flash.now[:danger] = 'Invalid email/password combination'
    #   render 'new_pat'
    # end
  end

  #Action to destroy session on user logout.
  def destroy
    sign_out
    redirect_to root_path
  end
end
