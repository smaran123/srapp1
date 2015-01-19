class Attendance < ActiveRecord::Base
  belongs_to :user
  belongs_to :receiver, :class_name => 'User'
  belongs_to :subject
  belongs_to :batch
  belongs_to :admin
end
