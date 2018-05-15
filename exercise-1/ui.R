# ui.R
library(shiny)
library(plotly)
library(shinythemes)
shinyUI(navbarPage(theme = shinytheme("cyborg"),
  "Electoral College",
  # Create a tab panel for your map
  tabPanel(
    "Map",
    titlePanel("Electoral College Votes"),
    # Create sidebar layout
    sidebarLayout(

      # Side panel for controls
      sidebarPanel(
        
        # Input to select variable to map
        selectInput(
          "mapvar",
          label = "Variable to Map",
          choices = list(
            "Population" = "population",
            "Electoral Votes" = "votes",
            "Votes / Population" = "ratio"
          )
      ),
      tags$br(),
      HTML("<strong>Use the above filter to change the variable
           seen on the map</strong>"),
      tags$div(class = "random", checked = NA,
               tags$p("Here is some more random info")),
      tags$div(class = "sidebar", 
               tags$h5("Here is some more text that serves no real purpose"))
    ),
               
      
      # Main panel: display plotly map
      mainPanel(
        plotlyOutput("map"),
        tags$link(rel = "stylesheet", href = "/style.css"),
        tags$div(class = "summary", checked = NA,
                 tags$p("This map shows the electoral college votes by states. The darker
                        the color, the higher the number of votes. California has 
                        the highest votes.")
                 ),
        tags$a(href = "https://www.archives.gov/federal-register/electoral-college/about.html",
               "Click here for more information")
      )
    )
  ),
  tabPanel("About",
           tags$h1("The About Page"),
           tags$h6("This webiste gives you electoral college information.  You can navigate
                   to the map page for more information and an interactive map")
  )
  # Create a tabPanel to show your scatter plot
))
