class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   validates :name, presence: true
   validates_uniqueness_of :name

   has_many :friendships

   has_many :friends, :through => :friendships

   has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"

   has_many :invers_friends, :through => :inverse_friendships, :source => :user




end
