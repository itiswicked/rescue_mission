require 'rails_helper'

feature 'questions' do

  let!(:question1) { FactoryGirl.create(:question) }
  let!(:question2) { FactoryGirl.create(:question) }
  let!(:question3) { FactoryGirl.create(:question) }

  before(:each) { visit '/' }

  scenario 'user views index' do

    expect(page).to have_content question1.title
    expect(page).to have_content question2.title
    expect(page).to have_content question3.title


    # test expecting most recent questions are at top of list
    within 'ul.questions li:nth-child(1)' do
      expect(page).to have_content question3.title
    end

    within 'ul.questions li:nth-child(3)' do
      expect(page).to have_content question1.title
    end
  end

  scenario 'user views details of individual question' do
# save_and_open_page
    click_link question1.title
    expect(page).to have_content question1.body
  end

end
