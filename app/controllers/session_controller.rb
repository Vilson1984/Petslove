class SessionController < ApplicationController
  def new
  end
  
  def create
    # BUSCA DO USUÁRIO NO BANCO, BUSCANSO PELO EMAIL (conforme consta na linha 8 do doc /session/new.html.erb )
    user = User.find_by(email: params[:session][:email].downcase)
    # AUTENTICANDO O USUÁRIO COM O MÉTODO AUTENTICATE. A CAPACIDADE DE QUITAÇÃO DE SENHA, ETC ESTÁ EM MODEL/USER/VALID_EMAIL...
    if user && user.autenticate(params[:session][:password])
      sign_in(user) # DECLARADO EM MODULE SESSION HELPER
      redirect_to user_path(user) # REDIRECIONAR O USUÁRIO PARA A ROTA SHOW DO USUÁRIO 
    else
      flash.now[:danger] = 'Email ou senha inválidos' # MOSTRA ERRO DE LOGIN
      render 'new'
    end
  end

  def destroy
    sign_out
    flash[:success] = 'Logout com sucesso'
    redirect_to entrar_path
  end

end
