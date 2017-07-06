class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #after_create :send_admin_mail
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	def send_devise_notification(notification, *args)
	  devise_mailer.send(notification, self, *args).deliver_later
	end         
end
