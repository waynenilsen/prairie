% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/request-request-line.R
\name{uri}
\alias{uri}
\title{Request URI}
\usage{
uri(x)
}
\arguments{
\item{x}{A \code{request} object.}
}
\description{
Get a request uri.
}
\examples{

name_generator <- route(
  'GET',
  '^/wizard/[a-z]+$',
  function(req) {
    res <- response()
    
    # An alternative to passing information
    # as a request query
    wizard_name <- gsub('^/wizard/', '', uri(req))
    
    picker <- list(
     title = c('The', 'Dark Lord', 'Sir'),
     name = wizard_name,
     of = 'of the',
     adjective = c('Enduring', 'Swift', 'Red', 'Great'),
     noun = c('Heavens', 'Coldness', 'Winglelings', 'Stars')
    )
    
    body(res) <- paste(
      lapply(picker, function(n) n[sample(length(n), 1)]),
      collapse = ' '
    )
    
    res
  }
)

name_gen_m <- mockup(name_generator)

res <- name_gen_m('GET', '/wizard/jenkins')
body(res)

res <- name_gen_m('GET', '/wizard/merlin')
body(res)

res <- name_gen_m('GET', '/wizard/sparrowhawk')
body(res)
}
\seealso{
Other HTTP.request.request.line: \code{\link{method}},
  \code{\link{query}}
}

