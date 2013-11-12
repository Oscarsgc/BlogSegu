class UserMailer < ActionMailer::Base
	default  from: 'tecnoblog.ucb@gmail.com'
	def activate_acount(user)
    	@user = user
    	mail(to: @user.email, subject: 'Registro')
	end

	def new_follower(seguidor, seguido)
		@usuarioSeguidor = seguidor
		@usuarioSeguido = seguido
		@url  = 'ltecnoblog/users/'+@usuarioSeguidor.id.to_s
		mail(to: @usuarioSeguido.email, subject: 'Nuevo Seguidor!')
	end

end

