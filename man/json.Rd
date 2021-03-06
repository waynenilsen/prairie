% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/jsonify.R
\name{json}
\alias{as.json}
\alias{as.json.data.frame}
\alias{as.json.list}
\alias{is.json}
\alias{json}
\title{Convert Objects to JSON}
\usage{
is.json(x)

as.json(x, ...)

\method{as.json}{list}(x, ...)

\method{as.json}{data.frame}(x, ...)
}
\arguments{
\item{x}{Any \R object.}

\item{\ldots}{Additional arguments to pass on to \code{jsonlite::toJSON}.}
}
\description{
When building a web server or API it is often useful to send more complex 
data obects. Within prairie one can do this by converting the object to JSON.
Additionally, prairie exposes the generic \code{as.json} function allowing 
users to specify how their custom classes need to be converted to JSON.
}
\details{
For the included \code{as.json} functions, the excellent package 
\code{jsonlite} does all the heavy lifting behind the scenes. This package is
straightforward to use and is recommended for those who wish to create 
further \code{as.json} functions.

Setting a response object body as an object with class json will 
automatically set the response object's Content-Type to application/json.
}
\examples{
as.json(list(one = 'fish', two = 'fish'))
as.json(data.frame(red = 'fish', blue = 'fish'))

res <- response()
body(res) <- as.json(
  list(
    list(name = 'ged', job = 'wizard'),
    list(name = 'sparrowhawk', job = 'wizard')
  )
)

is.json(body(res))
res[['Content-Type']] == 'application/json'

}

