.global <- new.env()

initResourcePaths <- function() {
  if (is.null(.global$loaded)) {
    shiny::addResourcePath(
      prefix = 'shinyRGL',
      directoryPath = system.file('www', package='shinyRGL'))
    .global$loaded <- TRUE
  }
  HTML("")
}