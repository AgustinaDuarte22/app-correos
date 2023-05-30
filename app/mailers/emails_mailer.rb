
class EmailsMailer < ApplicationMailer
  def send_email(email)
    @email = email
    mail(to: email.to, subject: email.subject) do |format|
      format.text { render plain: email.body }
    end
  end
  
end
