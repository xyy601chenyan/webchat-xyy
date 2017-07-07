class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   validates :name, presence: true
   validates_uniqueness_of :name

   sync :all
   has_many :friendships
   has_many :friends, :through => :friendships
   has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
   has_many :inverse_friends, :through => :inverse_friendships, :source => :user
   has_many :conversations, :foreign_key => :sender_id

   def unread(user, friend)
     converstaion = Conversation.between(user.id, friend.id).first
     if !converstaion.nil?
       converstaion.messages.where(read: false, user_id: friend.id).count
     else
       0
     end
   end

end
