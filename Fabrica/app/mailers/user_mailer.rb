class UserMailer < ActionMailer::Base
  default from: "vinicius@etica-ti.com.br"

  def redefinir_senha(user)
  	self.smtp_settings[:user_name]      = "vinicius@etica-ti.com.br"
	self.smtp_settings[:password]       = "100ajuste"
	self.smtp_settings[:port]           = "587"
	self.smtp_settings[:address]        = "smtp.gmail.com"
  	@user = user
  	@url = "#{edit_user_url(id: @user.id)}"
  	mail(to: @user.email, subject: 'Redefincao de senha')
  end
end
