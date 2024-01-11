# README

## Getting Started
This project uses Ruby on Rails:

```
Ruby version: 3.1.0
Rails version: 7.0.8
```

First, install dependencies:

```bash
bundle install
```

Create, migrate and seed the database:

```bash
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed
```

Start the server
```bash
bundle exec rails s
```

Open Postman or any other way to send requests to try the endpoints.


API Routes:
  City:
  ```
GET http://localhost:3000/api/v1/cities -> find all
GET http://localhost:3000/api/v1/cities/:id -> find id
GET http://localhost:3000/api/v1/city/name -> find city name
GET http://localhost:3000/api/v1/city/state -> find city state
POST http://localhost:3000/api/v1/city/create -> create city
  ```

 Client:
 ```
GET http://localhost:3000/api/v1/clients -> find all
GET http://localhost:3000/api/v1/clients/:id -> find id
POST http://localhost:3000/api/v1/client/name -> find client name
POST http://localhost:3000/api/v1/client/create -> create client 
PATCH http://localhost:3000/api/v1/client/:id -> update client name
DELETE http://localhost:3000/api/v1/client/:id -> delete client
 ```
To run the test suites:
```bash
bundle exec rspec
```




