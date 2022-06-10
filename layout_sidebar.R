## ------------------------------------- ##
         # Layout Options - Sidebar
## ------------------------------------- ##
# Call needed libraries
library(shiny); library(htmltools); library(lterpalettefinder)

# User Interface (UI) --------------
ui <- fluidPage(

  # Title of app
  headerPanel(list(title = "Layout Options - Sidebar",
                   htmltools::img(src = "lter_logo.png",
                                  height = 62,
                       align = "right") ) ),

  # Decide on sidebar layout
  sidebarLayout(

    # UI - Sidebar Content ----
    sidebarPanel(

      # Heading
      htmltools::h3("Decide on Number of Histogram Bins"),

      # Slider for deciding on number of historgram bins
      sliderInput(inputId = "bin_num",
                  label = "Number of bins:",
                  min = 5, value = 30, max = 50),

      # Heading
      htmltools::h3("Enter Plot Labels"),

      # X-axis label
      textInput(inputId = "x_lab", label = "X-Axis Label"),

      # Y-axis label
      textInput(inputId = "y_lab", label = "Y-Axis Label"),

      # Plot title
      textInput(inputId = "title", label = "Plot Title"),

      # Heading
      htmltools::h3("Pick a Plot Color"),
      selectInput(inputId = "color",
                  label = "Choose a Color",
                  choices = palette_find(site = "LTER"),
                  selected = palette_find(site = "LTER")[2])
    ), # Close `sidebarPanel(...`

    # UI - Main Panel Content ----
    mainPanel(
      plotOutput(outputId = "histo")
    )
  , position = 'right') # Close `sidebarLayout(...`
) # Close `fluidPage(...`

# Server ---------------------------
server <- function(input, output){

  # Reactively grab the user's inputs
  slider_val <- reactive({ input$bin_num })
  x_name <- reactive({ input$x_lab })
  y_name <- reactive({ input$y_lab })
  plot_main <- reactive({ input$title })
  color_choice <- reactive({ input$color })

  # Histogram assembly
  output$histo <- renderPlot({
    graphics::hist(x = sample(x = 1:1000,
                              size = 100,
                              replace = TRUE),
                   breaks = slider_val(),
                   col = color_choice(),
                   xlab = x_name(),
                   ylab = y_name(),
                   main = plot_main())
    })

} # Close `server{...`

# Assemble App ---------------------
shinyApp(ui = ui, server = server)

# End ----
