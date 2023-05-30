# app/workers/email_worker.rb
class EmailWorker
    include Sidekiq::Worker
  
    def perform(email_id)
      # Lógica para enviar el correo electrónico
      email = Email.find(email_id)
      ::EmailMailer.send_email(email).deliver_async
    end
  end
  