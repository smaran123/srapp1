class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  belongs_to :admin
  #  has_one :batch, :dependent => :destroy
  has_many :subjects, :dependent => :destroy
  has_many :students_batches
  has_many :batches, through: :students_batches
end
