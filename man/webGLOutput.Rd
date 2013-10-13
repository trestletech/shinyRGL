\name{webGLOutput}
\alias{webGLOutput}
\title{Renger a WebGL Element}
\usage{
  webGLOutput(outputId, width = "100\%", height = "400px")
}
\arguments{
  \item{outputId}{The ID of the \code{glOutput} associated
  with this element}

  \item{width}{The width of the WebGL scene. Must be a
  valid CSS unit (like "100\%", "400px", or "auto") or a
  number, which will be treated as a number of pixels.}

  \item{height}{Plot height. See \code{width} for details.}
}
\description{
  Render a WebGL \link{renderWebGL} in an application page.
}
\examples{
\dontrun{
   webGLOutput("sctPlot")
}
}
\author{
  Jeff Allen \email{jeff@trestletech.com}
}

