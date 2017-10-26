### Exercise 1 ###

# Load the httr and jsonlite libraries for accessing data
library("httr")
library("jsonlite")

## For these questions, look at the API documentation to identify the appropriate endpoint and information.
## Then send GET() request to fetch the data, then extract the answer to the question

# How many forks does the most popular repository (by number of forks) have when you search for the term "d3"?
# (search for the term, and sort descending by the number of forks)
base.uri <- 'https://api.github.com'
resource <- '/search/repositories'
url.full <- paste0(base.uri, resource)
query.params <- list(q="d3", sort="forks", order="desc")
response <- GET(uri.full, query = query.params)
response <- content(response, "text")
body.data <- fromJSON(response.content)
most.popular.forks <- body.data$items[1, "forks"]

# How many public repositories does our course organization have?
base.uri <- 'https://api.github.com'
resource <- '/orgs/info201a-au17/repos'
url.full <- paste0(base.uri, resource)
query.params <- list(type="public")
response <- GET(url.full, query = query.params)
response.content <- content(response, "text")
body.data <- fromJSON(response.content)  # extract and parse
num.repos <- nrow(body.data$items)