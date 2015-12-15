require 'rails_helper'

describe Question do

  let(:valid_question) { FactoryGirl.create(:question) }

  let(:invalid_question) { FactoryGirl.build(:invalid_question) }


  context 'question is valid' do
    describe '#save' do
      it 'should return true' do
        expect(valid_question.save).to eq true
      end
    end

    describe '#errors' do
      it 'should return an empty hash' do
        expect(valid_question.errors.messages).to eq({})
      end
    end
  end

  context 'question is invalid' do

    describe '#save' do
      it 'should return false' do
        expect(invalid_question.save).to eq false
      end
    end

    describe '#errors' do
      it 'should return a hash of errors' do
        errors = {
          title: ["is too short (minimum is 40 characters)"],
          body: ["is too short (minimum is 150 characters)"]
        }
        invalid_question.save
        expect(invalid_question.errors.messages).to eq(errors)
      end
    end

  end
end
