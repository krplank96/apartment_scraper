# here is some packages we need
library(rvest)
library(mailR)

# URL of the search results page
url <- "https://www.zillow.com/homes/for_rent/New-York-NY_rb/?price=1000-2000" # need to change this

# Read the HTML content of the page
html <- read_html(url)

# Extract the apartment details
apartment_details <- html %>%
  html_nodes(".list-card-info") %>%
  html_text()

# Send an email with the apartment details
send.mail(from = "krplank96@gmail.com",
          to = "krplank96@gmail.com",
          subject = "Apartments Available",
          body = apartment_details,
          smtp = list(host.name = "smtp.gmail.com", port = 465,
                      user.name = "your_email@gmail.com", passwd = "your_password", ssl = TRUE),
          authenticate = TRUE,
          send = TRUE)