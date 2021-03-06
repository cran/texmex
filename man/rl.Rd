% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotrl.evm.R, R/predict.evm.R
\name{plot.rl.evmOpt}
\alias{plot.rl.evmOpt}
\alias{plot.rl.evmSim}
\alias{plot.rl.evmBoot}
\alias{rl}
\alias{rl.evmOpt}
\alias{rl.evmSim}
\alias{rl.evmBoot}
\alias{print.rl.evmOpt}
\title{Return levels}
\usage{
\method{plot}{rl.evmOpt}(
  x,
  xlab,
  ylab,
  main,
  pch = 1,
  ptcol = 2,
  cex = 0.75,
  linecol = 4,
  cicol = 0,
  polycol = 15,
  smooth = FALSE,
  sameAxes = TRUE,
  type = "median",
  ylim = NULL,
  plot. = TRUE,
  ...
)

\method{plot}{rl.evmSim}(
  x,
  xlab,
  ylab,
  main,
  pch = 1,
  ptcol = 2,
  cex = 0.75,
  linecol = 4,
  cicol = 0,
  polycol = 15,
  smooth = FALSE,
  sameAxes = TRUE,
  type = "median",
  ylim = NULL,
  plot. = TRUE,
  ...
)

\method{plot}{rl.evmBoot}(
  x,
  xlab,
  ylab,
  main,
  pch = 1,
  ptcol = 2,
  cex = 0.75,
  linecol = 4,
  cicol = 0,
  polycol = 15,
  smooth = FALSE,
  sameAxes = TRUE,
  type = "median",
  ylim = NULL,
  plot. = TRUE,
  ...
)

rl(
  object,
  M = 1000,
  newdata = NULL,
  se.fit = FALSE,
  ci.fit = FALSE,
  alpha = 0.05,
  unique. = TRUE,
  ...
)

\method{rl}{evmOpt}(
  object,
  M = 1000,
  newdata = NULL,
  se.fit = FALSE,
  ci.fit = FALSE,
  alpha = 0.05,
  unique. = TRUE,
  ...
)

\method{rl}{evmSim}(
  object,
  M = 1000,
  newdata = NULL,
  se.fit = FALSE,
  ci.fit = FALSE,
  alpha = 0.05,
  unique. = TRUE,
  all = FALSE,
  sumfun = NULL,
  ...
)

\method{rl}{evmBoot}(
  object,
  M = 1000,
  newdata = NULL,
  se.fit = FALSE,
  ci.fit = FALSE,
  alpha = 0.05,
  unique. = TRUE,
  all = FALSE,
  sumfun = NULL,
  ...
)

\method{print}{rl.evmOpt}(x, digits = 3, ...)
}
\arguments{
\item{x}{Object passed to plot and print methods.}

\item{xlab, ylab, main, pch, ptcol, cex, linecol, cicol, polycol, smooth, sameAxes, ylim}{Further arguments to plot methods.}

\item{type}{For calls to plot methods for objects of class
\code{rl.evmSim} or \code{rl.evmBoot}, specifies whether to
use the sample mean (\code{type="mean"}) or median
(\code{type="median"}) estimate of the return levels.}

\item{plot.}{Parameter for plot method, whether to produce plots.}

\item{...}{Further arguments to be passed to methods.}

\item{object}{An object of class \code{evmOpt}, \code{evmSim} or
\code{evmBoot}.}

\item{M}{The M-observation return level is computed by the
function. Defaults to \code{M = 1000}.}

\item{newdata}{Data from which to calculate the return level. If
not provided, the original data used to fit the model is used.
Column names must match those of original data matrix used for
model fitting.}

\item{se.fit}{Whether or not to return the standard error of the
predicted value. Defaults to \code{se.fit = FALSE}.}

\item{ci.fit}{Whether or not to return a confidence interval for
the predicted value. Defaults to \code{ci.fit = FALSE}. For
objects of class \code{evmOpt}, if set to \code{TRUE} then the
confidence interval is a simple symmetric confidence interval
based on the estimated approximate standard error. For the
\code{evmSim} and \code{evmBoot} methods, the confidence
interval represents quantiles of the simulated distribution of
the parameters.}

\item{alpha}{If \code{ci.fit = TRUE}, a 100(1 - alpha)\%
confidence interval is returned. Defaults to \code{alpha =
0.050}.}

\item{unique.}{If \code{unique. = TRUE}, predictions for only the
unique values of the linear predictors are returned, rather
than for every row of the original dataframe or of
\code{newdata} if this latter is specified. Defaults to
\code{unique. = TRUE}.}

\item{all}{For the \code{evmSim} and \code{evmBoot} methods, if
\code{all = TRUE}, the predictions are returned for every
simulated parameter vector. Otherwise, only a summary of the
posterior/bootstrap distribution is returned. Defaults to
\code{all = FALSE}.}

\item{sumfun}{For the \code{evmSim} and \code{evmBoot} methods, a
summary function can be passed in. If \code{sumfun = FALSE},
the default, the summary function used returns the estimated
mean and median, and quantiles implied by \code{alpha}.}

\item{digits}{Number of digits to show when printing output.}
}
\description{
Computation of return levels and confidence intervals for extreme
value models.
}
\details{
The M-observation return level is defined as the value
    that is expected to be exceeded only once every M
    observations. Thus, it is an estimate of a high quantile of
    the fitted distribution.

In models fit by the \code{evm} family of functions with
\code{family=gpd}, only a fraction of the data is actually
included in the model; the fitted GPD is a conditional model,
conditioning on the threshold having been exceeded. This
consideration is taken into account by \code{rl} which calculates
unconditional return levels from the entire distribution of
observations above and below the GPD fitting threshold.
}
\examples{
mod <- evm(rain, qu=.8) # daily rainfall observations
rl(mod, M=100*365) # 100-year return level
}
