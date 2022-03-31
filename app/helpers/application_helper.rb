module ApplicationHelper
    #renderizar se tiver um artigo
    def render_if(condition, template, record)
        render template, record if condition
    end

    def sub_masked_email(email)
        email.gsub(/(?<=.{4}).*@.*(?=\S{3})/, '***@*****')
    end
end
