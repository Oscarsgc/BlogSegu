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
    admin2=User.create!(name: "Carlos Andres Jordan Zeballos",
                         email: "andresjordanze@gmail.com",
                         password: "Seguridad1234",
                         password_confirmation: "Seguridad1234",
                         birthday: "11-10-1992",
                         career: "Ingenieria de Sistemas", 
                         admin: true)
  end
end