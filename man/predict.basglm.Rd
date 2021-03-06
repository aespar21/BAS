\name{predict.basglm}
\alias{predict.basglm}
\title{Prediction Method for an object of class basglm}
\description{Predictions under model averaging from a BMA (BAS) object for GLMS
}
\usage{\method{predict}{basglm}(object, newdata, se.fit=FALSE, 
      type=c("response", "link"), top=NULL,
      estimator="BMA", prediction=FALSE, ...)}

\arguments{
  \item{object}{An object of class "basglm", created by \code{bas.glm}}
  \item{newdata}{dataframe, new matrix or vector of data for predictions. May 
    include a column for the intercept or just the predictor variables.
  If a dataframe, the variables are extracted using model.matrix using
  the call that created 'object'.  May be missing in which case the data used for fitting will be used for prediction.} 
   \item{se.fit}{indicator for whether to compute se of fitted and predictied values}
  \item{type}{Type of predictions required. The default is on the scale of the linear predictors; the alternative "response" is on the scale of the response variable. Thus for a default binomial model the default predictions are of log-odds (probabilities on logit scale) and type = "response" gives the predicted probabilities.
   }
    \item{top}{A scalar interger M.  If supplied, subset the top M models,
  based on posterior probabilities for model predictions and BMA.}
  \item{estimator}{estimator used for predictions.  Currently supported
   options include:
    \cr
    'HPM' the highest probability model \cr
    'BMA' Bayesian model averaging, using optionally only the 'top'
    models \cr
    'MPM' the median probability model of Barbieri and Berger. \cr
    'BPM' the model that is closest to BMA predictions under squared
  error loss. BMA may be computed using only the 'top' models if supplied}
   \item{prediction}{logical value to indicate whether the observed design matrix used in fitting or the newdata will be used for predictions}
     \item{...}{optional extra arguments}
}
\value{a list of
  \item{Ybma}{predictions using BMA}
  \item{Ypred}{matrix of predictions under each model}
    \item{postprobs}{renormalized probabilities of the top models}
  \item{best}{index of top models included}
}
\details{Use BMA to form predictions using the top highest probability
  models. 
}

\seealso{\code{\link{bas.glm}}, \code{\link{predict.bas}}, \code{\link{fitted.bas}}
}
\examples{
library(MASS)
data(Pima.tr)
data(Pima.te)
Pima.bas = bas.glm(type ~ ., data=Pima.tr, n.models= 2^7, method="BAS",
           betaprior=CCH(a=1, b=nrow(Pima.tr)/2, s=0), family=binomial(),
           modelprior=uniform())
 pred = predict(Pima.bas, newdata=Pima.te, top=1)  # Highest Probability model
 cv.summary.bas(pred$fit, Pima.te$type, score="miss-class")
}
\author{Merlise Clyde}
\keyword{regression}
