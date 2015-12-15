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
    click_link question1.title
    expect(page).to have_content question1.body
  end

  scenario 'user posts new question' do
    click_link 'Ask Question'
    expect(page).to have_content 'New Question'

    title = 'Why are ducks so crazy? I have a duck related story to share'
    body = 'The thing about ducks is that they will attack you if youre not'\
           'careful. This one one time a duck came up and started attacking'\
           'me, and I was all like... WHY?'
    fill_in 'Title', with: title
    fill_in 'Body',  with: body
    click_button 'Submit'

    # Redirect to show page for newly created question
    expect(page).to have_content body
  end

  scenario 'user attempts to post invalid question' do
    click_link 'Ask Question'
    fill_in 'Title', with: 'Why duck cray cray?'
    fill_in 'Body',  with: 'WHY?'
    click_button 'Submit'

    errors = [
      "Title is too short (minimum is 40 characters)",
      "Body is too short (minimum is 150 characters)"
    ]

    errors.each { |error| expect(page).to have_content(error) }
  end

end
