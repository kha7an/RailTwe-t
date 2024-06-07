# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

# Создание пользователей
User.create!([
               {
                 username: 'alina_minhazhova',
                 email: 'alina@example.com',
                 password: 'password123'
               },
               {
                 username: 'rustam_akhmetov',
                 email: 'rustam@example.com',
                 password: 'password123'
               },
               {
                 username: 'gulnara_kamalova',
                 email: 'gulnara@example.com',
                 password: 'password123'
               },
               {
                 username: 'ramil_nuriev',
                 email: 'ramil@example.com',
                 password: 'password123'
               },
               {
                 username: 'ilnur_safiullin',
                 email: 'ilnur@example.com',
                 password: 'password123'
               }
             ])

