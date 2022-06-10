## ------------------------------------- ##
# User Interface Elements
## ------------------------------------- ##
# Call needed libraries
library(shiny); library(htmltools)

# User Interface (UI) --------------
element_ui <- fluidPage(

  # Add a title that appears in the browser tab
  title = "Shiny UI Elements",

  # Title within app
  headerPanel(list(title = "User Interface Elements",
                   htmltools::img(src = "lter_logo.png",
                                  height = 42, align = "right") ) ),

  # Explain this 'app'
  htmltools::br(),
  htmltools::h4("This 'app' is meant to show the range of allowable user interface (UI) elements that Shiny has ready for your use. In addition to including each input type in the app, how Shiny perceives that input internally is placed immediately below its respective input. This should prove helpful as you develop more nuanced ", htmltools::code("server"), " operations in future."),
  htmltools::br(),

  # Decide on layout -- Three equal columns
  fluidRow(
    # UI - Column 1 ---------------
    column(width = 4,



    ), # Close `column(...`

    # UI - Column 2 ---------------
    column(width = 4,


    ), # Close `column(...`

    # UI - Column 3 ---------------
    column(width = 4,



    ) # Close `column(...`
  ) # Close `fluidRow(...`
) # Close `fluidPage(...`

# Server ---------------------------
# The server is technically a function
element_server <- function(input, output){



} # Close `function(...){...`

# Assemble App ---------------------
shinyApp(ui = element_ui, server = element_server)

# End ----
