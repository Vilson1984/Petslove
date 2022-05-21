class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params) #CRIAMOS A VARIÁVEL USER E INSTANCIAMOS ESSE OBJETO COM PARAMS, ESSES PARÂMETROS ESTÃO DECLARADOS NO PRIVATE

       if @user.save
        flash[:sucess] = 'Usuário cadastrado com sucesso!' #FLASH É UM HASH QUE O RAILS DISPONIBILIZA PARA MANDAR MSGS PARA O USUÁRIO
        redirect_to root_url #REDICIONARÁ O USUÁRIO PARA A PÁGINA INDEX
       else
           render 'new' #SENÃO REDIRECIONA PARA A PÁGINA NEW 
       end
    end

    private 
    # A FUNÇÃO VAI FILTRAR OS PARÂMETROS EVITAR QUE O USUÁRIO INJETE UM PARAMETRO DESCONHECIDO CAUSANDO
    # COMPORTAMENTO INDESEJÁVEL.
    # CHAMAREMOS A VARIAVEL PARAMS. CHAMAREMOS O METODO REQUIRE PARA OBRIGAR O USUÁRIO A PASSAR 
    # DENTRO DA CHAVE(:USER) OS PARAMETROS EMAIL, NAME, PASSWORD E PASSAWORD_DIGEST         
    def user_params
        params.require(:user).permit(:email, :name, :password, :password_confirmation)
    end
end
