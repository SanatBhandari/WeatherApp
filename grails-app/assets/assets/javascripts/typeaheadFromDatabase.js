/**
 * This file adds the typeahead functionality to the Weather App
 * I used the Twitter Typeahead plugin for JQuery (http://twitter.github.io/typeahead.js/), mainly its Bloodhound Search Engine
 */

$(document).ready(function(){
    var citiesLocal = citiesFromGSP                 // Get the list of the cities from the form.gsp page
    var cities = new Bloodhound({                   // Initialize the Bloodhound search engine by including its tokenizers
        datumTokenizer: Bloodhound.tokenizers.whitespace,
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        local: citiesLocal                          // The dataset used for this operation is citiesLocal which is a local variable for the cities obtained from the list in the Database
    });

    $('.typeahead').typeahead(                      // Utilizing the inbuilt function for the typeahead CSS class and setting various parameters
        {
            hint:true,
            highlight:true,
            minLength:1
        },
        {
            name:'cities',
            source: cities,                         // The source of the typeahead is the cities object declared above
            limit: 6                                // The limit of the results displayed at a time is 6. This is to make the search faster and reduce the load on the browser
        });
});

