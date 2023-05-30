require 'email_worker'
class EmailsController < ApplicationController
  def new
    @email = Email.new
  end

  def create
    email = Email.new(email_params)
    if email.save
      # Envío del correo electrónico utilizando Sidekiq
      ::EmailsMailer.send_email(email).deliver_later
      redirect_to emails_confirmation_path
    else
      flash[:alert] = 'No se pudo enviar el correo electrónico.'
      render :new
    end
  end

  def confirmation
    render :create
  end

  private

  def email_params
    params.require(:email).permit(:to, :from, :subject, :body)
  end
end


  

