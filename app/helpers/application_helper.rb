module ApplicationHelper
    #renderizar se tiver um artigo
    def render_if(condition, template, record)
        render template, record if condition
    end

    def sub_masked_email(email)
        email.gsub(/(?<=.{4}).*@.*(?=\S{3})/, '***@*****')
    end
   
    def month_day_year(value)
        #formatação da data
        l(value, format: '%B %e, %Y').capitalize
    end

    def month_year(value)
        #formatação da data
        l(value.to_datetime, format: '%B %e, %Y').capitalize
    end
    
end
