### Exercise 5 ###
library(jsonlite)
library(dplyr)
library(httr)
source("api-key.R")
# Read in your api-key.R file (that you'll create). Store your api-key in a variable in that file.
# Write a function that allows you to specify a movie, that does the following:
GetReview <- function(movie) {
  # Construct a search query using YOUR api key
  # The base URL is https://api.nytimes.com/svc/movies/v2/reviews/search.json
  # Your parameters should include a "query" and an "api_key"
  # Note: the HTTR library will take care of spaces in the arguments
  # See the interactive console for more detail:https://developer.nytimes.com/movie_reviews_v2.json#/Console/GET/reviews/search.json
  base.url <- "https://api.nytimes.com/svc/movies/v2/reviews/search.json"
  query.params <- list(query = movie, api_key = api.key)
  
  # Request data using your search query
  query.params <- list(query = movie, api_key = api.key)
  response <- GET(base.url, query = query.params)
  body <- content(response, "text")
  results <- fromJSON(body)
  # What type of variable does this return?
  typeof(results)
  # Flatten the data stored in the `$results` key of the data returned to you
  flat <- flatten(results$results)
  # From the most recent review, store the headline, short summary, and link to full article each in their own variables
  first.review <- flat[1,]
  first.headline <- first.review$headline
  first.short.summary <- first.review$summary_short
  first.link <- first.review$link.url
  

  # Return an list of the three pieces of information from above
  return(list(headline = first.headline, short.summary = first.short.summary, 
              link = first.link))
}

# Test that your function works with a movie of your choice
GetReview("It")
