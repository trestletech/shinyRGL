library(shiny)

#' Run the bivar example
#'
#' Run the bivar example form the shinyRGL package.
#'
#' @param port The TCP port that the application should listen on. Defaults to port 8100.
#' @param launch.browser If true, the system's default web browser will be launched automatically after the app is started. Defaults to true in interactive sessions only.
#' @param workerId: Can generally be ignored. Exists to help some editions of Shiny Serv
#' @importFrom shiny runApp
#' @author Michael J. Kane \email{kaneplusplus@@gmail.com}
#' @examples \dontrun{
#'  runBivarExample()
#' }
#' @export
runBivarExample <- function(port = 8100L,
         launch.browser = getOption("shiny.launch.browser", interactive()),
         workerId = "") {
  runApp( system.file("examples", "bivar", package='shinyRGL'), port=port,
    launch.browser=launch.browser, workerId=workerId)
}

#' Run the scatterplot example
#'
#' Run the scatterplot example form the shinyRGL package.
#'
#' @param port The TCP port that the application should listen on. Defaults to port 8100.
#' @param launch.browser If true, the system's default web browser will be launched automatically after the app is started. Defaults to true in interactive sessions only.
#' @param workerId: Can generally be ignored. Exists to help some editions of Shiny Serv
#' @importFrom shiny runApp
#' @author Michael J. Kane \email{kaneplusplus@@gmail.com}
#' @examples \dontrun{
#'  runBivarExample()
#' }
#' @export
runScatterplotExample <- function(port = 8100L,
         launch.browser = getOption("shiny.launch.browser", interactive()),
         workerId = "") {
  runApp( system.file("examples", "scatterplot", package='shinyRGL'), port=port,
    launch.browser=launch.browser, workerId=workerId)
}

