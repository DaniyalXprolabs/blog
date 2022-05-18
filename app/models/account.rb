class Account < ApplicationRecord
  belongs_to :supplier
  validates :supplier_id, presence:true
end
