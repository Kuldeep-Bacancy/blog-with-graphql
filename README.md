##### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby [3.1.2]
- Rails [7.0.7]
- Postgres

### 1. Check out the repository

```bash
https://github.com/Kuldeep-Bacancy/blog-with-graphql.git
```

### 2. Install Gems

Install Gem dependencies using bundle install

```bash
bundle install
```

### 3. Create and setup the database

Run the following commands to create and setup the database.

```ruby
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed
```

### 4. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

### 5. To execute mutations and queries you can do that playground

```ruby
  http://localhost:3000/graphiql
```

And now you can visit the site with the URL <http://localhost:3000>
