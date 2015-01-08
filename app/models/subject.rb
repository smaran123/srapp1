class Subject < ActiveRecord::Base
  belongs_to :batch
  belongs_to :user
  has_many :students_batches
end
