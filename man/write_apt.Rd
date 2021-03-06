% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/write_apt.R
\name{write_apt}
\alias{write_apt}
\title{Write a lsit of apt packages}
\usage{
write_apt(path = ".", apt_input = NULL)
}
\arguments{
\item{path}{Path to project}

\item{apt_input}{A list of Debian packages that should be installed. The base
image used is usually the latest released version of Ubuntu.}
}
\description{
Writes a list of Debian packages that should be installed.  Caution: If you have a Dockerfile,
this file will be ignored.
}
\examples{
write_apt(path = ".",
apt_input = "
texlive-latex-base
texlive-latex-recommended
texlive-science
texlive-latex-extra
texlive-fonts-recommended
dvipng
ghostscript")
}
