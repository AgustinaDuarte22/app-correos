require 'rails_helper'

RSpec.describe Email, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:to) }
    it { should validate_presence_of(:from) }
    it { should validate_presence_of(:subject) }
    it { should validate_presence_of(:body) }
  end

  describe 'saving' do
    it 'saves a valid email' do
      email = FactoryBot.build(:email) # Asegúrate de definir una fábrica (factory) para generar objetos Email válidos
      expect(email.save).to be true
    end

    it 'does not save an invalid email' do
      email = FactoryBot.build(:email, to: nil) # Genera un objeto Email inválido omitiendo el campo 'to'
      expect(email.save).to be false
    end
  end
end
