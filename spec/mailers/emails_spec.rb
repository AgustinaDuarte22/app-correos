require 'rails_helper'

RSpec.describe EmailsMailer, type: :mailer do
  describe 'send_email' do
    let(:email) { FactoryBot.create(:email) }

    it 'sends the email' do
      expect { EmailsMailer.send_email(email).deliver_now }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end

    it 'sends the email to the correct recipient' do
      expect { EmailsMailer.send_email(email).deliver_now }.to change { ActionMailer::Base.deliveries.count }.by(1)
      expect(ActionMailer::Base.deliveries.last.to).to eq([email.to])
    end

    it 'has the correct subject and body' do
      expect { EmailsMailer.send_email(email).deliver_now }.to change { ActionMailer::Base.deliveries.count }.by(1)
      expect(ActionMailer::Base.deliveries.last.subject).to eq(email.subject)
      expect(ActionMailer::Base.deliveries.last.body.decoded).to match(/MyTexthola como andas todo bien/)

    end
  end
end
