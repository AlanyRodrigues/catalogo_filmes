# Usuários
# ========================
user1 = User.find_or_create_by!(email: "usuario1@test.com") do |u|
  u.password = "123456"
  u.name = "Lucas"
end

user2 = User.find_or_create_by!(email: "usuario2@test.com") do |u|
  u.password = "123456"
  u.name = "Mariana"
end

user3 = User.find_or_create_by!(email: "usuario3@test.com") do |u|
  u.password = "123456"
  u.name = "Bruno"
end

# ========================
# Filmes
# ========================
avengers = Movie.find_or_create_by!(title: "Vingadores: Ultimato") do |m|
  m.description = "Os heróis enfrentam Thanos em uma batalha épica."
  m.year = 2019
  m.duration = "3h 02min"
  m.director = "Anthony & Joe Russo"
  m.category = "Ação"
  m.user = user1
end

protector = Movie.find_or_create_by!(title: "O Protetor") do |m|
  m.description = "Um ex-agente secreto protege os inocentes com suas habilidades."
  m.year = 2014
  m.duration = "1h 50min"
  m.director = "Antoine Fuqua"
  m.category = "Ação"
  m.user = user1
end

schindler = Movie.find_or_create_by!(title: "A Lista de Schindler") do |m|
  m.description = "A história real de Oskar Schindler, que salvou centenas de judeus."
  m.year = 1993
  m.duration = "3h 15min"
  m.director = "Steven Spielberg"
  m.category = "Drama"
  m.user = user1
end

brilliant_mind = Movie.find_or_create_by!(title: "Uma Mente Brilhante") do |m|
  m.description = "A vida do matemático John Nash e sua luta contra a esquizofrenia."
  m.year = 2001
  m.duration = "2h 15min"
  m.director = "Ron Howard"
  m.category = "Drama"
  m.user = user1
end

mother_piece = Movie.find_or_create_by!(title: "Minha Mãe é uma Peça") do |m|
  m.description = "Dona Hermínia, uma mãe divertida e atrapalhada, carece de atenção."
  m.year = 2013
  m.duration = "1h 40min"
  m.director = "Anderson Mello"
  m.category = "Comédia"
  m.user = user1
end

evil = Movie.find_or_create_by!(title: "Invocação do Mal") do |m|
  m.description = "Casos sobrenaturais de Ed e Lorraine Warren, investigadores paranormais."
  m.year = 2013
  m.duration = "1h 52min"
  m.director = "James Wan"
  m.category = "Terror"
  m.user = user1
end

terminator = Movie.find_or_create_by!(title: "O Exterminador do Futuro 2") do |m|
  m.description = "Um androide do futuro protege John Connor para salvar a humanidade."
  m.year = 1991
  m.duration = "2h 17min"
  m.director = "James Cameron"
  m.category = "Ficção"
  m.user = user1
end

side_good = Movie.find_or_create_by!(title: "O Lado Bom da Vida") do |m|
  m.description = "Pat e Tiffany tentam superar traumas do passado e encontrar o amor."
  m.year = 2012
  m.duration = "2h 02min"
  m.director = "David O. Russell"
  m.category = "Romance"
  m.user = user1
end

imitation_game = Movie.find_or_create_by!(title: "O Jogo da Imitação") do |m|
  m.description = "Alan Turing e sua equipe tentam quebrar códigos nazistas na Segunda Guerra."
  m.year = 2014
  m.duration = "1h 54min"
  m.director = "Morten Tyldum"
  m.category = "Drama"
  m.user = user1
end

interstellar = Movie.find_or_create_by!(title: "Interestelar") do |m|
  m.description = "Um grupo de astronautas viaja através de um buraco negro."
  m.year = 2014
  m.duration = "2h 49min"
  m.director = "Christopher Nolan"
  m.category = "Ficção"
  m.user = user1
end

# ========================
# Comentários
# ========================

# Interestelar
interstellar.comments.create!(content: "Um dos melhores filmes de ficção científica!", user: user1)
interstellar.comments.create!(content: "A trilha sonora é simplesmente épica.", user: user2)
interstellar.comments.create!(content: "Matthew McConaughey está incrível!", user: user3)

# Vingadores
avengers.comments.create!(content: "Um encerramento épico para uma década de heróis!", user: user1)

# O Protetor
protector.comments.create!(content: "Excelente filme de ação, cheio de suspense.", user: user1)
protector.comments.create!(content: "História envolvente e personagens marcantes.", user: user2)

# Invocação do Mal
evil.comments.create!(content: "Muito assustador, quase não consegui dormir!", user: user1)
evil.comments.create!(content: "Os efeitos são incríveis e a história prende do começo ao fim.", user: user2)

# A Lista de Schindler
schindler.comments.create!(content: "Um drama inesquecível sobre coragem e humanidade.", user: user3)

# Uma Mente Brilhante
brilliant_mind.comments.create!(content: "Muito inspirador e emocionante.", user: user3)

# Minha Mãe é uma Peça
mother_piece.comments.create!(content: "Hilário, divertido para toda a família.", user: user2)

puts "✅ Seed finalizado com sucesso!"
