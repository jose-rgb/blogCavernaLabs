module ArticlesHelper
    def month_day_year(datetime)
        #formatação da data
        datetime.strftime('%B %e, %Y')
    end
end
