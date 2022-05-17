class MyValidator<ActiveModel::Validator
  def validate(record)
    unless record.title.start_with?'D'
      record.errors.add :title,"Need a name starting with D please"
    end
  end
end
class Article < ApplicationRecord
  #include ActiveModel::Validations
  #validates_with MyValidator
  include Visible
  has_many :comments, dependent: :destroy
  validates_associated :comments
  #before_validation :set_title
  #after_validation :set_title
  before_save :set_title
  validates :title, presence: { message:"Please enter a title" }
  validates :body, presence: true, length: {minimum: 10}

  private
  def set_title
    self.title = "Pay electricity bill and TV Bill"
  end
end
