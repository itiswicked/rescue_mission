require 'rails_helper'

feature 'answers' do
  let!(:question) { FactoryGirl.create(:question) }

  let!(:answer) do
    a = FactoryGirl.build(:answer).question = question
    a.save
    a
  end

  before(:each) { visit "/questions/#{question.id}" }

  scenario 'user views answers on questions' do
    expect(page).to have_content answer.body
    expect(page).to have_content 'Answer Question'
  end

  context 'when submission body is not long enough' do
    scenario 'user answers question' do
      fill_in 'answer_body', with: "Cause she's a bar-oque and needs some money"
      click_button 'Submit'
      expect(page).to have_content 'Body is too short (minimum is 50 characters)'
    end
  end

  context 'when submission body is long enough' do
    scenario 'user answers question' do
      fill_in 'answer_body', with: 'I think it has something to do with the '\
                                   'eagle flying in the north and the fact '\
                                   'we are just memories of our future selves'
      click_button 'Submit'
      expect(page).to have_content 'I think'
    end
  end

end
