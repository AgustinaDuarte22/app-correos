FactoryBot.define do
  factory :email do
    to { "agusduarte@gmail.com" }
    from { "tonga@hotmail.com" }
    subject { "hola" }
    body { "MyTexthola como andas todo bien" }
  end
end
