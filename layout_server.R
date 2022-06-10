# Server ---------------------------
# Assemble server function
layout_server <- function(input, output){

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
