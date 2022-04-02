#path dos arquivos quando i18 for iniciado
I18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
#linguas
I18n.available_locales  = %i[en pt-BR]
#linguagem padrao
I18n.default_locale = :'pt-BR'