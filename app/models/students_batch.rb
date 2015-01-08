class StudentsBatch < ActiveRecord::Base
belongs_to :user
belongs_to :batch
belongs_to :subject
end
