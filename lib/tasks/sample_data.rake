namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Oscar Sergio Gonzalez Camacho",
                         email: "oscar_sgc@hotmail.com",
                         password: "<paprika>",
                         password_confirmation: "<paprika>",
                         birthday: "14-12-1992",
                         career: "Ingenieria de Sistemas", 
                         admin: true)
  end
end