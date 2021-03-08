# README

This README would normally document whatever steps are necessary to get the
application up and running.


* Ruby version
Use  ruby '2.7.1'

* Configurations:
- Set token for ProxyCrawl API in environment variable in .env file

- Setup database config in database.yml (postgres)

* Run Application

 Setup the rails app using following commands:

 - rvm use ruby-2.7.1 --install
 
 - rails db:setup
 
 - rails s

* Background Worker
- rails fetch_products:fetch_from_amazon
