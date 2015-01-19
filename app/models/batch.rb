class Batch < ActiveRecord::Base
  has_many :subjects, :dependent => :destroy
  belongs_to :admin
  accepts_nested_attributes_for :subjects, :allow_destroy => true, :reject_if=>:all_blank
#  has_many :students_batches
#  has_many :users,:through => students_batches
has_many :mark_reports, :dependent => :destroy
end

