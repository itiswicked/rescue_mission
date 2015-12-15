class Answer < ActiveRecord::Base
  belongs_to :question

  validates :body, length: { minimum: 50 }
end
