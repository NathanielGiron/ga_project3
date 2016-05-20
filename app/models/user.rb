class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_universal_and_determines_account
  has_one :member, :dependent => :destroy
  has_many :user_projects
  has_many :projects, through: :user_projects

  #users can have many projects, through their assigned tasks
  has_many :tasks
  has_many :projects, through: :tasks
  def is_admin?
  	is_admin
  end

  def create
    user = User.new
    user.skip_confirmation!
    user.save!
  end
end
