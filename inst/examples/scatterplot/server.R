# Must be executed BEFORE rgl is loaded on headless devices.
options(rgl.useNULL=TRUE)

library(shiny)
library(shinyRGL)
library(rgl)

xPts <- runif(1000, 0, 1)
yPts <- runif(1000, 0, 1)
zPts <- runif(1000, 0, 1)

#' Define server logic required to generate and 3d scatterplot
#' @author Jeff Allen \email{jeff@@trestletech.com}
shinyServer(function(input, output) {
  
  # Expression that generates a rgl scene with a number of points corresponding
  # to the value currently set in the slider.
  output$sctPlot <- renderWebGL({
    points3d(xPts[1:input$pts],
             yPts[1:input$pts],
             zPts[1:input$pts])
    axes3d()
  })
})