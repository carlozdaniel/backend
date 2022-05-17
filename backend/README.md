# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  - ruby 3.0.1p64 

* System dependencies
  - Redis 
  - Sidekiq
  - elasticsearch
  
* Configuration
  
  - install figaro
  
  > bundle exec figaro install 

  - example figaro install 
  
        create  config/application.yml
        append  .gitignore

  - add code at file application.yml
```
development:
  username_postgres: your_username
  password_postgres: "your_password"
  port_postgres: "5432"
  host_postgres: localhost
  github_token: "your_token"
  ```

* Database creation
 - rails db:create

* Database initialization
 - rails db:migration
* How to run the test suite
> rspec

* Services (job queues, cache servers, search engines, etc.)
  - redis-server 
  - sidekiq
  - sudo systemctl start elasticsearch 
* postman
- create user
  - http://localhost:3000/api/v1/users?username=carlozdaniel
  - http://localhost:3000/api/v1/users/1/repositories/search_repositories?search=blog
