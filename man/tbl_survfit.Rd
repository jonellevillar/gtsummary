% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tbl_survfit.R
\name{tbl_survfit}
\alias{tbl_survfit}
\title{Creates table of survival probabilities}
\usage{
tbl_survfit(
  x,
  times = NULL,
  probs = NULL,
  statistic = "{estimate} ({conf.low}, {conf.high})",
  label = NULL,
  label_header = NULL,
  estimate_fun = NULL,
  missing = "--",
  conf.level = 0.95,
  reverse = FALSE,
  failure = NULL
)
}
\arguments{
\item{x}{survfit object. Object may have no stratification
(e.g. \code{survfit(Surv(ttdeath, death) ~ 1, trial)}), or a single stratifying
variable (e.g. \code{survfit(Surv(ttdeath, death) ~ trt, trial)})}

\item{times}{numeric vector of times for which to return survival probabilities.}

\item{probs}{numeric vector of probabilities with values in (0,1)
specifying the survival quantiles to return}

\item{statistic}{string defining the statistics to present in the table.
Default is \code{"{estimate} ({conf.low}, {conf.high})"}}

\item{label}{string specifying variable or overall label. Default is
stratifying variable name or \code{"Overall"} when no stratifying variable present}

\item{label_header}{string specifying column labels above statistics. Default
is \code{"{prob} Percentile"} for survival percentiles, and \code{"Time {time}"} for n-year
survival estimates}

\item{estimate_fun}{function to format the Kaplan-Meier estimates. Default
is \link{style_percent} for survival probabilities and \link{style_sigfig} for
survival times}

\item{missing}{text to fill when estimate is not estimable. Default is \code{"--"}}

\item{conf.level}{Confidence level for confidence intervals. Default is 0.95}

\item{reverse}{Flip the probability reported, i.e. \code{1 - estimate}.
Default is \code{FALSE}.  Does not apply to survival quantile requests}

\item{failure}{DEPRECATED. Use \verb{reverse=} instead.}
}
\description{
\Sexpr[results=rd, stage=render]{lifecycle::badge("experimental")}
Function takes a \code{survfit} object as an argument, and provides a
formatted summary table of the results
}
\section{Example Output}{

\if{html}{Example 1}

\if{html}{\figure{tbl_survfit_ex1.png}{options: width=40\%}}

\if{html}{Example 2}

\if{html}{\figure{tbl_survfit_ex2.png}{options: width=27\%}}

\if{html}{Example 3}

\if{html}{\figure{survfit_cr_ex3.png}{options: width=27\%}}
}

\examples{
library(survival)
fit1 <- survfit(Surv(ttdeath, death) ~ trt, trial)
fit2 <- survfit(Surv(ttdeath, death) ~ 1, trial)

# Example 1 ----------------------------------
tbl_survfit_ex1 <- tbl_survfit(
  fit1,
  times = c(12, 24),
  label = "Treatment",
  label_header = "**{time} Month**"
)

# Example 2 ----------------------------------
tbl_survfit_ex2 <- tbl_survfit(
  fit2,
  probs = 0.5,
  label_header = "**Median Survival**"
)

# Example 3 Competing Events Example ---------
# adding a competing event for death (cancer vs other causes)
library(dplyr)
trial2 <- trial \%>\%
  mutate(
  death_cr = case_when(
    death == 0 ~ "censor",
    runif(n()) < 0.5 ~ "death from cancer",
    TRUE ~ "death other causes"
  ) \%>\% factor()
)

survfit_cr_ex3 <-
  survfit(Surv(ttdeath, death_cr) ~ grade, data = trial2) \%>\%
  tbl_survfit(times = c(12, 24), label = "Tumor Grade")
}
\author{
Daniel D. Sjoberg
}
