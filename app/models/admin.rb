class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  belongs_to :web_admin
  has_many :users, :dependent => :destroy
  has_many :batches, :dependent => :destroy  
   has_many :mark_reports, :dependent => :destroy
  def self.search(search)
  if search
    where('name LIKE ?', "%#{search}%")
  else
    all
  end
end
end
