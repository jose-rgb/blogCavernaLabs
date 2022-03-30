Article.delete_all

user = User.first
text = "here are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which "
p 'iniciando..'

#gerar 30 artigos de teste
Category.all.each do |category|
    30.times do 
        Article.create!(
            title: "Article #{rand(10000)}",
            body: text,
            category_id: category.id,
            user_id: user.id,
            created_at: rand(365).days.ago
        )
    end
end

p 'terminou'