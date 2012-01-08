\name{predict.fregre.GAM}
\Rdversion{1.1}
\alias{predict.fregre.lm}
\alias{predict.fregre.plm}
\alias{predict.fregre.glm}
\alias{predict.fregre.gsam}
\alias{predict.fregre.gkam}
\title{ Predict method for functional regression model}
\description{
 Computes predictions for regression between functional (and non functional) explanatory variables and scalar response.
\itemize{      
\item \code{predict.fregre.lm},	Predict method for functional linear model of \code{\link{fregre.lm}} fits object  using basis or principal component representation.
\item \code{predict.fregre.plm},	Predict method for semi-functional  linear regression model of \code{\link{fregre.plm}} fits object using using asymmetric kernel estimation.
\item \code{predict.fregre.glm},	Predict method for functional generalized  linear model of \code{\link{fregre.glm}} fits object using basis or principal component representation.
\item \code{predict.fregre.gsam},	Predict method for functional generalized spectral additive model of \code{\link{fregre.gsam}} fits object using basis or principal component representation.
\item \code{predict.fregre.gkam}, Predict method for functional generalized kernel additive model of \code{\link{fregre.gkam}} fits object using backfitting algorithm.
}
}
\usage{
\method{predict}{fregre.lm}(object,newx=NULL,type="response",\dots)
\method{predict}{fregre.plm}(object,newx=NULL,\dots)
\method{predict}{fregre.glm}(object,newx=NULL,type="response",\dots)
\method{predict}{fregre.gsam}(object, newx = NULL, type = "response",\dots)
\method{predict}{fregre.gkam}(object, newx = NULL, type = "response",\dots)
}
\arguments{
  \item{object}{ \code{fregre.lm},  \code{fregre.plm}, \code{fregre.glm},  \code{fregre.gsam} or \code{fregre.gkam} object.}
  \item{newx}{ An optional data list in which to look for variables with which to predict. If omitted, the fitted values are used. List of new explanatory data.}
  \item{type}{ Type of prediction (response or model term).}
  \item{\dots}{ Further arguments passed to or from other methods.}
}
\details{ 
These functions use the model fitting function \code{\link{lm}}, \code{\link{glm}} or \code{\link{gam}} properties.\cr
If using functional data derived, is recommended to use a number of bases to represent beta lower than the number of bases used to represent the functional data. \cr                                                                                                                                                                
The first item in the \code{data} list of \code{newx} argument is called \emph{"df"} and  is a data frame  with the response and non functional explanatory variables, as \code{\link{lm}}, \code{\link{glm}} or \code{\link{gam}}. Functional variables (\code{fdata} and \code{fd} class) are introduced in the following items in the \code{data} list of \code{newx} argument.
}
\value{
Return the predicted values and optionally:\cr
\item{predict.lm,predict.glm,predict.gam}{ produces a vector of predictions or a matrix of predictions and bounds with column names fit, lwr, and upr if interval is set. If se.fit is TRUE, a list with the following components is returned: fit vector or matrix as above.} 
\item{se.fit}{ standard error of predicted means.} 
\item{residual.scale}{ residual standard deviations.}
\item{df}{ degrees of freedom for residual.} 
}
\references{
Febrero-Bande,  M., Oviedo de la Fuente, M. (2012).  \emph{Statistical Computing in Functional Data Analysis: The R Package fda.usc.}
Journal of Statistical Software, 51(4), 1-28. \url{http://www.jstatsoft.org/v51/i04/}
}
\author{
Manuel Febrero-Bande, Manuel Oviedo de la Fuente \email{manuel.oviedo@usc.es}
}
\seealso{
See Also as:  \code{\link{fregre.lm}},  \code{\link{fregre.plm}}, \code{\link{fregre.glm}},  \code{\link{fregre.gsam}} and \code{\link{fregre.gkam}}. \cr
}
\examples{

# data(tecator)
# ind<-1:129
# data(tecator)
# x=tecator$absorp.fdata
# x.d1<-fdata.deriv(x)
# tt<-x[["argvals"]]
# dataf=as.data.frame(tecator$y)
# nbasis.x=11;nbasis.b=7
# basis1=create.bspline.basis(rangeval=range(tt),nbasis=nbasis.x)
# basis2=create.bspline.basis(rangeval=range(tt),nbasis=nbasis.b)
# f=Fat~s(Protein)+s(x)
# basis.x=list("x"=basis1,"x.d1"=basis1)
# basis.b=list("x"=basis2,"x.d1"=basis2)
# ldata=list("df"=dataf[ind,],"x"=x[ind],"x.d1"=x.d1[ind])

# res=fregre.gsam(Fat~Water+s(Protein)+x+s(x.d1),data=ldata,family=gaussian(),
# basis.x=basis.x,basis.b=basis.b)
# res2=fregre.gsam(Fat~te(Protein,k=3)+x,data=ldata,family=gaussian())

# a<-predict.fregre.gsam(res)
# plot(a,tecator$y$Fat[ind])
# b<-predict.fregre.gsam(res2,ldata)
# points(b,tecator$y$Fat[ind],col=2)

# res=fregre.gsam(Fat~s(Water,k=3)+s(x.d1,k=3)+s(x,k=3),data=ldata,
# family=gaussian(),basis.x=basis.x,basis.b=basis.b)
# newldata=list("df"=dataf[-ind,],"x"=x[-ind],"x.d1"=x.d1[-ind])
# pred<-predict.fregre.gsam(res,newldata)
# plot(pred,tecator$y$Fat[-ind])

# res.glm=fregre.glm(Fat~Water+x.d1+x,data=ldata,family=gaussian(),
# basis.x=basis.x,basis.b=basis.b)
# pred.glm<-predict.fregre.glm(res.glm,newldata)
# newy<-tecator$y$Fat[-ind]
# points(pred.glm,tecator$y$Fat[-ind],col=2)

# res.plm=fregre.plm(Fat~Water+x.d1,data=ldata)
# pred.plm<-predict.fregre.plm(res.plm,newldata)
# points(pred.plm,tecator$y$Fat[-ind],col=3)

## Time-consuming 
# res.gkam=fregre.gkam(Fat~Water+x.d1+x,data=ldata)
# pred.gkam=predict(res.gkam,newldata)
# points(pred.gkam,tecator$y$Fat[-ind],col=4)

# ((1/length(newy))*sum((drop(newy)-pred)^2))/var(newy)
# ((1/length(newy))*sum((newy-pred.plm)^2))/var(newy)    
# ((1/length(newy))*sum((newy-pred.glm)^2))/var(newy)    
# ((1/length(newy))*sum((newy-pred.gkam)^2))/var(newy)    


                                                                                                              
}
\keyword{regression}