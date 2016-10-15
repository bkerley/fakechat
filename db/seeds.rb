# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

chat_lines = <<-EOF
You too, thanks.
Mm-hm.
Sure.
Yeah.
Nice!
Cool.
Sounds interesting.
*smiles without saying anything*
EOF

chat_lines.lines.map(&:chomp).each do |txt|
  Response.where(body: txt).first_or_create
end
