module ApplicationHelper
    #renderizar se tiver um artigo
    def render_if(condition, template, record)
        render template, record if condition
    end
end
