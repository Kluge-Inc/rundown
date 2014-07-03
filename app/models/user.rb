class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Owns one or more postboxes to send leaflets to
  has_many :postboxes

  has_many :feeds, through: :postboxes


end
