# Weather App
This is a simple weather App project based on [Grails](https://grails.org/) 

The data used in this project is the ```city.list.json``` a collection of a *million plus cities* around the globe that is publically available via the Open Weather website

The purpose of this project is to create a simple Application that outputs the weather of any city selected from the database with **Groovy** and its **Grails** framework, working with **RESTFul APIs** and **clients**. 

The APIs used for this project is [Open Weather Map](https://openweathermap.org/api "Click here to go to the API page") and [MapQuest](https://www.mapquest.com/ "Click Here") (To be implemented) 

The **RESTFul API Client** that I used is [Postman](https://www.getpostman.com/downloads/ "Click here to go to the Download page")

## Phase One
I created a basic ```logic.js``` file to manipulate the DOM by passing the values to and from PHP via AJAX by utilizing [jQuery](https://jquery.com/). The *projectlet* consists of a form that asks the user to input a cityname and the project would retrieve the states corresponding to the city from the database. The purpose of this simple exercise is two-fold:

* To setup the base for incorporating Groovy into the future phases of the project
* Refresh *jQuery, AJAX, PHP Scripting, and SQL concepts*

## Phase Two
Migration from the ```HTML, CSS, JS``` Combo to the utilization of the **Groovy** Programming Language, along with its **Grails** web development framework. The front-end utilizes [Bootstrap](https://getbootstrap.com/) for its styling and includes elements of [JQuery](https://jquery.com/) for AJAX. 

Currently, the code has an intuitive UI to input the location, sign-in (To be implemented), and a user-friendly output which includes an icon for the weather along with information about the weather. 

The updated code files are contained in the ```grails-app``` directory. As of now, the code fetches the weather information for any ```(City, Country Code)``` combo or ```Zip Code```. I will include the *type-ahead functionality* for prediction of inputs along with setting up the Database for the same.

## Phase Three
Added Unit Tests for different model classes in the ```src/test/..``` directory and would add the remaining tests for the classes. Included a basic typeahead script in ```form.gsp``` to model a typeahead (In-Progress)

I'll be using [Auth0](https://auth0.com/ "Click here to go to Auth0 page)), an authentication and authorization platform, to keep a track of different users. *Spring Security Plugin + Auth0* takes care of the login page.

Added Logger Files to the project to bulletproof debugging capabilties down-the-road

----------------------------------------------------------------------------------------------------------------------------------------
**PS** The project is still in progress and will be updated as soon as I work on the remaining parts of it. I am using **Test-driven development** along with **Continuous Integration** and other standard Software Development practices on this project. The current repository includes limited functionality in the project and is essentially a **prototype**

```grails-app``` directory consists of the Grails application while the remaining files are the refresher files that I coded prior to jumping in Groovy. I will clean-up the directory structure for clarity once am done with the project

**IN THE PIPELINE:** Spring Security Plugin for logging in users, i18n, Typeahead to predict inputs, additional API integration for reverse geocoding ([MapQuest](https://www.mapquest.com/ "Click Here")), a more comprehensive user dashboard 
