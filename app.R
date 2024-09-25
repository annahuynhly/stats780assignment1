library(shiny)  
library(shinycssloaders) # for loading screens
library(colourpicker)
library(tidyverse)

source("datasets.R")
source("functions.R")
source("contact_page.R")
source("graph_page.R")

ui = navbarPage(
  title = "Annual Crop Inventory of Saskatchewan and Manitoba between 2009 and 2013",
  tabPanel("Creating Graphs of Different Crops", page_home),
  tabPanel("Contact & Credits", page_contact_and_credits),
  id = "navbarID",
  theme = shinythemes::shinytheme("flatly"), # may want to change theme
)

server = function(input, output) {
  source("graphs_server.R",  local = TRUE)$value
}

shinyApp(ui = ui, server = server)
