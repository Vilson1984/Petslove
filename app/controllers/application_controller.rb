class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    # INCLUIR ESSE MÓDULO NOS CONTROLLERS. TODOS OS CONTROLLERS DE APPLICATION_CONTROLLER HERDARÃO OS MÉTODOS DO MÓDULO SESSION_HELPER 
    include SessionHelper

end
