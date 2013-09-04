# Must be executed BEFORE rgl is loaded on headless devices.
options(rgl.useNULL=TRUE)

library(shiny)
library(rgl)
library(shinyRGL)
library(MASS)

#' Define server logic required to generate and 3d scatterplot. Modified version
#' of the 'bivar' example written by Daniel Adler that ships with rgl.
#' @author Jeff Allen \email{jeff@@trestletech.com}
#' @author Daniel Adler
# $Id: bivar.r 564 2007-02-22 09:56:01Z dmurdoch $
shinyServer(function(input, output) {
  
  # Expression that generates a rgl scene with a number of points corresponding
  # to the value currently set in the slider.
  output$bivar <- renderWebGL({
  
    # parameters:
    n<-input$pts
    ngrid<-40
    
    # generate samples:
    set.seed(31415)
    x<-rnorm(n); y<-rnorm(n)
    
    # estimate non-parameteric density surface via kernel smoothing
    denobj<-kde2d(x, y, n=ngrid)
    den.z <-denobj$z
    
    # generate parametric density surface of a bivariate normal distribution
    xgrid <- denobj$x
    ygrid <- denobj$y
    bi.z <- dnorm(xgrid)%*%t(dnorm(ygrid))
    
    # visualize:
    zscale<-20
    
    # setup env:
    light3d()
    
    # Draws the simulated data as spheres on the baseline
    spheres3d(x,y,rep(0,n),radius=0.1,color="#333399")
    
    # Draws non-parametric density
    surface3d(xgrid,ygrid,den.z*zscale,color="#FF2222",alpha=0.5)
    
    # Draws parametric density
    surface3d(xgrid,ygrid,bi.z*zscale,color="#2222FF",front="lines") 
    
  })
})