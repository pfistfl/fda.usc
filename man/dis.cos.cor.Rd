\name{dis.cos.cor}
\Rdversion{1.1}
\alias{dis.cos.cor}
\title{Proximities between functional data}
\description{Computes the cosine correlation distance between two functional dataset.}
\usage{
dis.cos.cor(fdata1,fdata2=NULL,as.dis=FALSE)
}
\arguments{  
  \item{fdata1}{Functional data 1 or curve 1.}
  \item{fdata2}{Functional data 2 or curve 2.} 
  \item{as.dis}{Returns the distance matrix from class \code{dist}.}      
}
\details{Computes the cosine correlation distance between two functional dataset of class \code{fdata}.}
\value{ Returns a proximities matrix between functional data.}
\references{
Kemmeren P, van Berkum NL, Vilo J, et al. (2002). \emph{Protein Interaction Verification and Functional Annotation by Integrated Analysis of Genome-Scale Data
}. Mol Cell. 2002 9(5):1133-43. 
}
\seealso{See also  \code{\link{metric.lp}} and \code{\link{semimetric.NPFDA}} }
\examples{
 r1<-rnorm(1001,sd=.01)
 r2<-rnorm(1001,sd=.01)
 x<-seq(0,2*pi,length=1001)
 fx<-fdata(sin(x)/sqrt(pi)+r1,x)
 dis.cos.cor(fx,fx)
 dis.cos.cor(c(fx,fx),as.dis=TRUE)
 fx0<-fdata(rep(0,length(x))+r2,x)
 plot(c(fx,fx0))
 dis.cos.cor(c(fx,fx0),as.dis=TRUE)
 }
\keyword{ cluster }
