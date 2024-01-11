# frozen_string_literal: true

city = City.create!(name: "recife", state: "PE")

city2 = City.create!(name: "fortaleza", state: "CE")

city3 = City.create!(name: "natal", state: "RN")

Client.create!(name: "Rafael", sex: "m", age: 20, birthday: 20.years.ago , city_id: city.id)

Client.create!(name: "Pepa", sex: "m", age: 20, birthday: 20.years.ago , city_id: city.id)

Client.create!(name: "Mateus", sex: "m", age: 20, birthday: 20.years.ago , city_id: city2.id)

Client.create!(name: "Ganso", sex: "m", age: 20, birthday: 20.years.ago , city_id: city3.id)
