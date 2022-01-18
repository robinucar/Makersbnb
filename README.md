## Database setup instructions
1. psql 
2. CREATE DATABASE bnb_app;
3. CREATE DATABASE bnb_app_test;
4. \c bnb_app
5. run sql saved in 01_creating_properties_table.sql and 02._creating_users_table.sql
6. \c bnb
7. run sql saved in 01_creating_properties_table.sql and 02._creating_users_table.sql




## USER STORY 1

	As a property owner,

	So I can share my empty spaces,

	I want to add empty spaces to the BNB app.

## USER STORY 2

	As a property owner, 

	So that I can have guests in all my bnb properties, 

	I want to be able to list multiple spaces on bnb app.

## USER STORY 3

	As a property owner,

	So I can share informations about my property,

	I want to add description, and price of my empty spaces. 

## USER STORY 4

	As a property owner,

	So that a guest can see a when my space is available,

	I’d like to add a range of available dates.

## USER STORY 5

	a) 	As a signed-up user,

	So that stay at a property,

	I want to request to hire any space for one night.

	b)	As a property owner,
		So that I can allow a guest to stay at my space,
		I want to be able to approve a request for hire.

## USER STORY 6

	As a property owner,

	So I do not want to keep non empty spaces on the list,

	I want to remove booked spaces.

## USER STORY 7

	As a property owner, 

	So that I can guarantee my bnb property/space will be booked on as many nights as possible, 

	I want booking to be available until/unless a user has CONFIRMED their booking request..

## USER STORY 8

	 As a propety owner,

	 So that only I can see my listed spaces.

  I want to sign up and have a unique log-in.

### User story 1 Domain Model Diagram
![bookmark_manager_diagram](/images/Domain_Model_Diagram1.png)
