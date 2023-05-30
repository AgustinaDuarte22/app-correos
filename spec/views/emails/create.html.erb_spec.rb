require 'rails_helper'

RSpec.describe 'emails/new.html.erb', type: :view do
  it 'displays the email creation form' do
    render

    expect(rendered).to have_field('to')
    expect(rendered).to have_field('from')
    expect(rendered).to have_field('subject')
    expect(rendered).to have_field('body')
    expect(rendered).to have_button('Enviar')
  end
end
