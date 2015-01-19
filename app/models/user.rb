class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  belongs_to :admin 
  has_many :subjects,:dependent => :destroy
  #  has_one :batch, :dependent => :destroy
  has_many :students_batches
  has_many :batches, through: :students_batches 
   has_many :given_attendences, :class_name => "Attendance",:foreign_key => :user_id, :dependent => :destroy
  has_many :received_attendences, :class_name => "Attendance", :foreign_key => :receiver_id, :dependent => :destroy
  has_many :mark_reports, :dependent => :destroy
end

