class MyValidator<ActiveModel::Validator
  def validate(record)
    unless record.title.start_with?'D'
      record.errors.add :title,"Need a name starting with D please"
    end
  end
end
class Article < ApplicationRecord
  include ActiveModel::Validations
  validates_with MyValidator
  include Visible
  has_many :comments, dependent: :destroy
  validates_associated :comments
  validates :title, presence: {message:"Please give the title of article it is necassary"}
  validates :body, presence: true, length: {minimum: 10}
end
