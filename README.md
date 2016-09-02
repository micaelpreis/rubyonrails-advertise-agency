# rubyonrails-advertise-agency
### Ruby on Rails - Advertise Agency

#### Objective

Create a web application in Ruby on Rails to serve banners for an advertising agency.

#### How To Run The Application

To run the aplication, you only need to run three commands on your terminal.

First start by cloning this repository into your computer. You can do this by typing the following command on your terminal:

	git clone https://github.com/micaelpreis/rubyonrails-advertise-agency.git

After the cloning is complete, you then need to set up the environment by running the following command in the folder "advertise-agency":

	docker-compose build
	docker-compose run app rake db:create
	docker-compose run app rake db:migrate
	docker-compose up

At last, to start the application, just run this command:

	docker run -p 3000:3000 advertise-agency

You can now check the application on your browser in [here](http://localhost:3000).

#### How To Run The Tests

In order to run the tests created for this application, you need to run the following command:

	(run tests command)

### Other Usefull Commands

	docker ps
	docker kill $(docker ps -q)


