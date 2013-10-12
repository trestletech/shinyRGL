#' Renger a WebGL Element
#' 
#' Render a WebGL \link{renderWebGL} in an application page.
#' @param outputId The ID of the \code{glOutput} associated with this element
#' @param width The width of the WebGL scene. Must be a valid CSS unit (like
#'   "100\%", "400px", or "auto") or a number, which will be treated as a number
#'   of pixels.
#' @param height Plot height. See \code{width} for details.
#' @importFrom shiny validateCssUnit
#' @importFrom shiny tagList
#' @importFrom shiny singleton
#' @importFrom shiny tags
#' @importFrom shiny div
#' @author Jeff Allen \email{jeff@@trestletech.com}
#' @examples \dontrun{ 
#'    webGLOutput("sctPlot")
#' }
#' @export
webGLOutput <- function(outputId, width="100%", height="400px"){
  style <- paste("width:", validateCssUnit(width), ";", "height:", 
                 validateCssUnit(height))
  
  tagList(
    singleton(tags$head(
      initResourcePaths(),
      tags$script(src = 'shinyRGL/CanvasMatrix.js'),
      tags$script(src = 'shinyRGL/glbinding.js'))
    ),
    div(id=outputId, class="shiny-gl-output", 
        style=style) 
  )
}