# rubyonrails-advertise-agency
## Ruby on Rails - Advertise Agency

### Objective

Create a web application in Ruby on Rails to serve banners for an advertising agency.

### Requirements

* the application needs to be developed in Ruby
* the application should be smart enough to render banners based on their revenue-performance
* the data that allows to determine how well a campaign is doing, is obtained through 3 CSV files:
	* impressions.cs
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

### How To Run The Application

To run the aplication, you only need to run a few commands on your terminal.

First start by cloning this repository into your computer:

	git clone https://github.com/micaelpreis/rubyonrails-advertise-agency.git

After the cloning is complete, you need to set up the environment:

	docker-compose build

Then, you need to create the database of the application:

	docker-compose run app rake db:create

At last, to start the application, just run this command:

	docker-compose up

You can now check the application on your browser in [here](http://localhost:3000).

### How To Use The Application

In order to use the application you need to follow the steps below:

1. Start the application
2. Go to [http://localhost:3000/](http://localhost:3000/}) and click on 'Load Data'
3. Go to [http://localhost:3000/campaigns/](http://localhost:3000/campaigns/) or click on 'Go To Campaigns'
4. Go to  [http://localhost:3000/campaigns/{campaign_id}](http://localhost:3000/campaigns/{campaign_id}) or select one of the campaigns by clicking on 'Show'

The application will render one of the top x banners for the campaign selected.

**Note 1:** If you want to delete all data in the application, go to [http://localhost:3000/](http://localhost:3000/}) and click on 'Clean Data'.

**Note 2:** If you want to change the CSV files to be loaded, put them in the folder "/app/assets/csv/" and delete the other ones present in that folder.

### Tests

There were two sets of tests created. The first set consisted on manually test the application, by creating CSV files with the data necessary to test all four scenarios when rendering a banner as well as test the import and clean data actions. The second, consisted on creating Rspec tests, that automatically test the application.

#### Manual Testing

The CSV files created by the author to test the application were filled with data so that we could test the following scenarios:

* **Campaign 1** - Show Top 10 Banners
	* 12 total banners, from ID '1' to '12', all with revenue
	* banners with ID '11' and '12' with less revenue than the others
	* **Expected Outcome**: show banners from ID '1' to 10' randomly

* **Campaign 2** - Show Top 8 Banners
	* 8 total banners, from ID '13' to '20', all with revenue
	* **Expected Outcome**: show banners from ID '13' to '20' randomly

* **Campaign 3** - Show Top 5 Banners
	* 5 total banners, from ID '21' to '25', all with revenue
	* **Expected Outcome**: show banners from ID '21' to '25' randomly

* **Campaign 4** - Show Top 3 Banners + 2 Banners With The Most Clicks
	* 6 total banners, from ID '26' to '31'
	* banners '26', '27' and '28' with revenue
	* banners '29', '30', '31' with no revenue, only clicks
	* banner '31' with less clicks than the others
	* **Expected Outcome**: show banners from ID '26' to '30' randomly

* **Campaign 5** - Show 3 Banners With The most Clicks + 2 Random Banners
	* 7 total banners, from ID '32' to '38'
	* banners '32', '33' and '34' with clicks
	* **Expected Outcome**: show banners '32', '33' and '34', plus two more banners from ID '35' to '38' randomly

#### Rspec

In order to run the tests created for this application, you need to run the following command:

	rspec


