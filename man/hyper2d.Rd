\name{phi1}
\alias{phi1}
\title{Compound Confluent hypergeometric function of two variables}
\description{Compute the Confluent Hypergeometric function of two
  variables, also know as a Horn hypergeometric function or Humbert's
  hypergeometric used in Gordy (1998) with integral representation:
  phi_1(a,b,c,x,y) = Beta(a,b) Int_0^1 t^(a-1) (1 - t)^(c-a-1) (1 -
  yt)^(-b)  exp(x t) dt
  \url{https://en.wikipedia.org/wiki/Humbert_series}  Note that Gordy's
  arguments for x and y are reversed in the reference above.

  Code for phi1 provided by Gordy.
}
\usage{phi1(a,b,c, x, y)}

\arguments{
  \item{a}{a > 0}
  \item{b}{arbitrary}
  \item{c}{c > 0}
  \item{x}{x > 0}
  \item{y}{0 <= y < 1}
}
  \references{Gordy 1998
 }
 \examples{
# special cases
# Phi1(a, b, c, x=0, y) = 2F1(b, a; c, y)
phi1(1, 2, 1.5, 0, 1/100);
hypergeometric2F1(2, 1, 1.5, 1/100, log = FALSE)

# Phi1(a, b=0, c, x, y) = Phi(a, b, c, x, y=0) = 1F1(a, c, x) ## ??
phi1(1, 0, 1.5, 3, 1/100);
hypergeometric1F1(1, 1.5, 3, log = FALSE);
}
\author{Merlise Clyde (\email{clyde@stat.duke.edu})}
\keyword{math}
