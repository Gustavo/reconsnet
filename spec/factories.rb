FactoryGirl.define do

  factory :user do
    name 'Test User'
    email 'example@example.com'
    role 'Admin'
    password 'changeme'
    password_confirmation 'changeme'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end

  factory :person do
    sequence(:name) { |n| "João n. #{n}" }
    sequence(:email) { |n| "joao#{n}@email.com" }
    gender 'Masculino'
  end

  factory :phone_number do
    # adiciona telefone já normalizado de acordo com o que o phony espera
    number '554599440907'
    phone_type 'Celular'
    provider 'Tim'
    label 'Casa'
  end

  factory :address do
    line1 'Rua Diamantina, 439'
    zip '85868-210'
    city 'Foz do Iguaçu'
    state_code 'PR'
    country_code 'BR'
  end

  factory :event do
    name 'Imersão Parametodológica'
    event_type 'Curso'
    start Time.now
    finish Time.now
  end

  factory :participation do
    person { |c| c.association(:person) }
    event { |c| c.association(:event) }
    status 'Inscrito'
    participation_type 'Professor'
  end


  ## This will use the User class (Admin would have been guessed)
  #factory :admin, class: User do
  #  first_name "Admin"
  #  last_name  "User"
  #  admin      true
  #end
end