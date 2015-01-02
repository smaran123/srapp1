class Batch < ActiveRecord::Base
  has_many :subjects, :dependent => :destroy
  accepts_nested_attributes_for :subjects, :allow_destroy => true, :reject_if=>:all_blank
end

