module Paginable
    protected

    #page corrente vai ser um parametro ou 1
    def current_page
        (params[:page] || 1).to_i
    end
end