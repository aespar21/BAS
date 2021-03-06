\name{list2matrix.bas}
\alias{list2matrix.bas}
\alias{list2matrix.which}
\alias{which.matrix}
\title{Coerce a BAS list object into a matrix}
\description{Models, coefficients, and standard errors in objects of
  class 'bas' are represented as  a list of lists to reduce storage by omitting
  the zero entries.  These functions coerce the list object to a matrix
  and fill in the zeros to facilitate other computations.  
}
\usage{
\method{list2matrix}{bas}(x, what,  which.models=NULL)

\method{list2matrix}{which}(x, which.models=NULL)

which.matrix(which, n.vars)
}
\arguments{
  \item{x}{a 'bas' object}
  \item{what}{name of bas list to coerce}
  \item{which.models}{a vector of indices use to extract a subset}
  \item{which}{\code{x$which} a list of lists of model indicators}
  \item{n.vars}{the total number of predictors, \code{x$n.vars}}
}
\value{a matrix representation of \code{x$what}, with number of rows equal
  to the length of which.models or total number of models and number of
  columns \code{x$n.vars}
}
\details{\code{list2matrix.bas(x, which)} is equivalent to
  \code{list2matrix.which(x)}, however, the latter uses sapply rather than
  a loop.  \code{list2matrix.which} and \code{which.matrix} both coerce
  \code{x$which} into a matrix. }  

\seealso{\code{\link{bas}}}
\examples{
\dontrun{library(MASS)
data(UScrime)
UScrime[,-2] = log(UScrime[,-2])
crime.bic =  bas.lm(y ~ ., data=UScrime, n.models=2^15, prior="BIC",
                    initprobs= "eplogp") 
coef = list2matrix.bas(crime.bic, "ols")  # extract all ols coefficients
se = list2matrix.bas(crime.bic, "ols.se")
models = list2matrix.which(crime.bic)     #matrix of model indicators
models = which.matrix(crime.bic$which, crime.bic$n.vars)     #matrix of model indicators}
}
\author{Merlise Clyde \email{clyde@stat.duke.edu}}
\keyword{regression}
