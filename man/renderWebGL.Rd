\name{renderWebGL}
\alias{renderWebGL}
\title{Render a WebGL Element}
\usage{
  renderWebGL(expr, width = "auto", height = "auto",
    env = parent.frame(), quoted = FALSE)
}
\arguments{
  \item{expr}{The expression to be evaluated which should
  produce a rgl scene.}

  \item{width}{Either "auto", in which case the width will
  be calculated (reactively) based on the size of the
  glOutput element associated with this function, or a
  numeric value representing the width of the desired WebGL
  scene in pixels.}

  \item{height}{The height of the WebGL scene. See
  \code{width} for details.}

  \item{env}{The environment in which \code{expr} should be
  evaluated.}

  \item{quoted}{Is \code{expr} a quoted expression (with
  \code{quote()})? This is useful if you want to save an
  expression in a variable.}
}
\description{
  Render a WebGL Shiny output.
}
\examples{
\dontrun{
   renderWebGL({
     points3d(1:10,1:10,1:10)
   })
}
}
\author{
  Jeff Allen \email{jeff@trestletech.com}
}

