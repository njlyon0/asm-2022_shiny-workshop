#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)
library(sf)

##### Wrangling (Eventually, move to global.R)

watershed_polys <- sf::read_sf(here::here("data", "exwatershed1"), layer = "exwatershed1")

#####

# Define UI for application that draws a histogram
ui <- navbarPage(
      "Andrews Forest",
      tabPanel("Overview",
        fluidPage(
          titlePanel("Overview"),
          fluidRow(
            column(4,
                   img(src = "https://lternet.edu/wp-content/uploads/2022/03/Lookout_Creek_in_the_HJ_Andrews_Experimental_Forest_Willamette_National_Forest_23908499686-1.jpg",
                       width = "100%")
                   ),
            column(8,
                   fluidRow(
                     h2("About The Forest"),
                     p("The H.J. Andrews Experimental Forest (AND) LTER is located in the Cascade Range of Oregon, and consists of 6,400 ha of conifer forest, meadows, and stream ecosystems. This mountain landscape experiences episodic disturbances, including fires, floods, and landslides. The question central to AND LTER research is: How do climate, natural disturbance, and land use, as influenced by forest governance, interact with biodiversity, hydrology, and carbon and nutrient dynamics? Andrews LTER research illuminates the complexity of native, mountain ecosystems such as: forest stream interactions; roles of dead wood; and effects of forest harvest and disturbance on hydrology, vegetation, and biogeochemistry over multiple time scales. Andrews LTER research has also been central to informing regional and national forest policy. Future research will address ongoing change in streams, forests, climate, and governance."),
                     h2("About This Project"),
                     p("This project demonstrates how a site might use Shiny apps to communicate results from their research")),
                   fluidRow(
                     leafletOutput("andrews_map")
                   )
                   )
            )
        )
        ),
        
      tabPanel("Watershed Characteristics",
               fluidPage(
                 titlePanel("Watershed Characteristics"),
                 fluidRow(
                   column(6,
                          leafletOutput("watershed_map")),
                   column(6,
                          textOutput("watershed_text"))
                 )
               )),
      tabPanel("Species Weights"),
      tabPanel("Something Else")
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    # Map with marker at forest
    output$andrews_map <- renderLeaflet({
        leaflet() %>% 
          addTiles() %>% 
          addCircleMarkers(lng = -122.1641168884823, lat = 44.2310583215366, label = "Andrews Forest", popup = "Andrews Forest", popupOptions = ?p) %>% 
        setView(-122.1641168884823, 44.2310583215366, zoom = 5)
      
    })
    
    # Watershed characteristics
    output$watershed_map <- renderLeaflet({
      leaflet() %>% 
        addTiles() %>% 
        addPolygons(data = watershed_polys$geometry)
    })
    
    output$watershed_text <- renderText("Placeholder for watershed text")
    
    
    
}

# Run the application 
shinyApp(ui = ui, server = server)
