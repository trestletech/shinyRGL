library(shiny)
library(shinyRGL)

#' Define UI for application that plots random 3d points
#' @author Jeff Allen \email{jeff@@trestletech.com}
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Shiny WebGL!"),
  
  # Sidebar with a slider input for number of points
  sidebarPanel(
    sliderInput("pts", 
                "Number of points:", 
                min = 10, 
                max = 1000, 
                value = 250)
  ),
  
  # Show the generated 3d scatterplot
  mainPanel(
    webGLOutput("sctPlot")
  )
))