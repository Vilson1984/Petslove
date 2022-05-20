 
class User < ApplicationRecord
    #HAS_ CRIARÁ HASHS PARA A SENHA, PROTEÇÃO EM CASO DE ATAQUE
    has_secure_password 

    #VAI USAR UMA EXPRESSÃO REGULAR PARA VALIDAR O EMAIL
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

    validates :name, presence:true, length:{maximum:50} #NÃO SE PODE CRIAR OUTRO USUÁRIO SEM ANTES PASSAR O NOME
    validates :password, length:{minimum:6}
    validates :email, presence:true, length:{maximum:255},
                                     format:{with:VALID_EMAIL_REGEX}, 
                                     uniqueness:{case_sensitive:true}


end
