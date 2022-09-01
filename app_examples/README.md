# R Shiny App Example Apps

Hello! This folder contains several example apps aimed at showcasing various components of a Shiny app. The scripts contained in this folder are described below so please check out the (short) summary and then feel free to adapt or modify each of these apps as needed!

## Script Explanations

-   **ui_elements.R** - This app shows several typical user interface (UI) widgets and how inputs in each of them are received by the server of the app. Seeing how these widgets "talk" to the server may help you to write your own server as you can better anticipate how the UI and server interact

- **layout_[...].R** - These scripts show the same app with three different visual layouts. "layout_server.R" is used by all three apps in an effort to demonstrate that the UI layout is relatively distinct from the internal workings of a given app. The three layout options are as follows: 
    - "layout_sidebar_ui.R" - An app with a sidebar versus a main panel
    - "layout_tabs_ui.R" - An app with content separated into tabs
    - "layout_fluidrow_ui.R" - An app with all content arranged via manually set rows and columns (the most customizable and least inherently structured way of laying out a Shiny app)
