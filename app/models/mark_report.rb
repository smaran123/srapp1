class MarkReport < ActiveRecord::Base
  belongs_to :user
  belongs_to :admin
  belongs_to :subject
  belongs_to :batch
end
