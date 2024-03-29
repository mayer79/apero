% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clinks.R
\name{clinks}
\alias{clinks}
\alias{clinks.default}
\alias{clinks.apero}
\title{Counts Number of Clinks}
\usage{
clinks(object, ...)

\method{clinks}{default}(object, ...)

\method{clinks}{apero}(object, ...)
}
\arguments{
\item{object}{An object of class \code{apero} or a vector of length one with the
number of persons.}

\item{...}{Arguments passed from or to other methods.}
}
\value{
The number of clinks.
}
\description{
Counts the number of glass clinks.
}
\section{Methods (by class)}{
\itemize{
\item \code{clinks(default)}: Calculates the number of glass clinks between n (= object) persons.

\item \code{clinks(apero)}: Calculates the number of glass clinks of all persons of an apero.

}}
\examples{
x <- apero()
clinks(x)
}
