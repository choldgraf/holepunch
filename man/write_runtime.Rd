% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/write_runtime.R
\name{write_runtime}
\alias{write_runtime}
\title{Write runtime.txt}
\usage{
write_runtime(path = ".", r_date = lubridate::ymd(lubridate::today()))
}
\arguments{
\item{path}{Path to project}

\item{r_date}{Date you need R to lock down to. By default it picks the most
recent date a file was touched in this project but you can override this by
specifying this explicitly. Date must be in ISO 8601 format.}
}
\description{
This function writes the language (in this case R) and a date from which
packages will be downloaded from \href{https://mran.microsoft.com/}{MRAN}. The file is written to a hidden folder
called `.binder/`.
}
