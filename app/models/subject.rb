class Subject < ActiveRecord::Base
  belongs_to :batch
  belongs_to :admin
  has_many :students_batches
  belongs_to :user
end

