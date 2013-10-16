\name{runScatterplotExample}
\alias{runScatterplotExample}
\title{Run the scatterplot example}
\usage{
  runScatterplotExample(port = 8100L,
    launch.browser = getOption("shiny.launch.browser", interactive()),
    workerId = "")
}
\arguments{
  \item{port}{The TCP port that the application should
  listen on. Defaults to port 8100.}

  \item{launch.browser}{If true, the system's default web
  browser will be launched automatically after the app is
  started. Defaults to true in interactive sessions only.}

  \item{workerId:}{Can generally be ignored. Exists to help
  some editions of Shiny Serv}
}
\description{
  Run the scatterplot example form the shinyRGL package.
}
\examples{
\dontrun{
 runBivarExample()
}
}
\author{
  Michael J. Kane \email{kaneplusplus@gmail.com}
}

