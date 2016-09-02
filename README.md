# rubyonrails-advertise-agency
### Ruby on Rails - Advertise Agency

#### Objective

Create a web application in Ruby on Rails to serve banners for an advertising agency.

#### Requirements

* the application needs to be developed in Ruby
* the application should be smart enough to render banners based on their revenue-performance
* the data that allows to determine how well a campaign is doing, is obtained through 3 CSV files:
	* impressions.csv
	* clicks.csv
	* conversons.csv
* there are 4 possible scenarios when displaying the banners:
	* x = amount of banners with conversions within a campaign

| Scenario | Requirements |
|----------|:-------------:|
| x > 10 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; | shows the Top 10 banners based on revenue within that campaign |
| 5 < x <= 10 | shows the Top x banners based on revenue within that campaign |
| 0 < x <= 5 | Your collection of banners should consists of 5 banners, containing:<br><ul><li>The Top x banners based on revenue within that campaign</li><li>Banners with the most clicks within that campaign to make up a collection of 5 unique banners when needed</li></ul> |
| x == 0 | Your collection of banners should consists of 5 banners, containing:<br><ul><li>The Top-5 banners based on clicks within that campaign</li><li>If there are less than 5 banners with clicks within that campaign, then add random banners within that campaign to make up a collection of 5 unique banners</li></ul> |

* the request http://localhost:3000/campaigns/{campaign_id} should somehow render or redirect to one of your top-x banners
* the top banners being served should not follow an order based on its performance, but they should appear in a random sequence
* the application should also avoid that a banner will be served twice, before the sequence has finished for a unique visitor

#### How To Run The Application

To run the aplication, you only need to run a few commands on your terminal.

First start by cloning this repository into your computer:

	git clone https://github.com/micaelpreis/rubyonrails-advertise-agency.git

After the cloning is complete, you need to set up the environment by running the following command in the folder "advertise-agency":

	docker-compose build

Then, you need to create the database of the application:

	docker-compose run app rake db:create

At last, to start the application, just run this command:

	docker-compose up

You can now check the application on your browser in [here](http://localhost:3000).

#### How To Use The Application

(TODO)

#### How To Run The Tests

In order to run the tests created for this application, you need to run the following command:

	(run tests command)


