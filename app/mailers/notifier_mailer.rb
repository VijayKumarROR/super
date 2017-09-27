class NotifierMailer < ApplicationMailer

	def mail_receive(user)
		@name = user.name
		@email = user.email
		mail(:to=> "vijivs055@gmail.com", :subject=> "Hai check your mail")
	end
end
