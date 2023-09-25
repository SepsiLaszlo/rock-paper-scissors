# README

The projects provides an extendable implementation for the rock, paper, scissors game.

## Features

- A rock, paper, scissors game with a nice UI
- Admins can manage tools on `/tools` endpoint
- RSpec tests
- Create Docker, docker-compose and nginx config to deploy the application to www.rock-paper-scissors.kir-dev.sch.bme.hu


## Deployment

1. Copy the master.key to the config folder of the project from a safe storage.

2. Create docker volumes for the application

```bash
docker volume create rock_paper_scissors_db
docker volume create rock_paper_scissors_storage
```

3. Set up the `.posgtres_password` file. Copy the the `.postgres_password.example` file into `.postgres_password`. Then
   set the `POSTGRES_PASSWORD` environment variable to be the same as `Rails.application.credentials.postgres_password`.

```bash
cp .postgres_password.example .postgres_password
```

4. Start the aplication

```bash
docker compose up -d
```

5. Setup the database

```bash
 docker compose exec web rails db:setup
```



