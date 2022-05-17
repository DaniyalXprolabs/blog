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
  validates :title, presence: true
  validates :body, presence: true, length: {minimum: 10}
end
