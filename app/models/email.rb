class Email < ApplicationRecord
    validates :to, :from, :subject, :body, presence: true
end
