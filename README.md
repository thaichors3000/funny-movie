# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


docker-compose build
docker-compose run --rm --service-ports ruby_dev
rails server -p $PORT -b 0.0.0.0
docker run -d -it <image_id>
docker ps
docker exec -it <container_id> bash
