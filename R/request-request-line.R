#' Request Method
#' 
#' Get information about a request such as method type, the requested resource
#' uri, the query component, or the requset HTTP protocol.
#' 
#' @param x A \code{request} object.
#' 
#' @family HTTP request request-line
#'   
#' @export
#' @name method
#' @examples
#' 
#' methodical <- route(
#'  c('GET', 'POST'),
#'  '^',
#'  function(req) {
#'    res <- response()
#'    
#'    if (method(req) == 'GET') {
#'      # handle when method is GET
#'      body(res) <- 'I got ya'  
#'      
#'    } else {
#'      body(res) <- 'Washingtong or Huffington?'
#'      
#'    }
#'    
#'    res
#'  }
#' )
#' 
#' methodical_m <- mockup(methodical)
#' 
#' res <- methodical_m('GET', '/')
#' res
#' 
#' res <- methodical_m('POST', '/')
#' body(res)
method <- function(x) {
  assert_that(is.request(x))
  x$method
}

#' Request URI
#' 
#' Get a request uri.
#' 
#' @inheritParams method
#' 
#' @family HTTP request request-line
#' 
#' @export
#' @name uri
#' @examples
#' 
#' name_generator <- route(
#'   'GET',
#'   '^/wizard/[a-z]+$',
#'   function(req) {
#'     res <- response()
#'     
#'     # An alternative to passing information
#'     # as a request query
#'     wizard_name <- gsub('^/wizard/', '', uri(req))
#'     
#'     picker <- list(
#'      title = c('The', 'Dark Lord', 'Sir'),
#'      name = wizard_name,
#'      of = 'of the',
#'      adjective = c('Enduring', 'Swift', 'Red', 'Great'),
#'      noun = c('Heavens', 'Coldness', 'Winglelings', 'Stars')
#'     )
#'     
#'     body(res) <- paste(
#'       lapply(picker, function(n) n[sample(length(n), 1)]),
#'       collapse = ' '
#'     )
#'     
#'     res
#'   }
#' )
#' 
#' name_gen_m <- mockup(name_generator)
#' 
#' res <- name_gen_m('GET', '/wizard/jenkins')
#' body(res)
#' 
#' res <- name_gen_m('GET', '/wizard/merlin')
#' body(res)
#' 
#' res <- name_gen_m('GET', '/wizard/sparrowhawk')
#' body(res)
uri <- function(x) {
  assert_that(is.request(x))
  x$uri
}

#' Request Query
#' 
#' Get a request query.
#' 
#' @inheritParams method
#' 
#' @family HTTP request request-line
#' 
#' @export
#' @name query
#' @examples
#' #' # This route prints out all query key, value pairs
#' route(
#'   'ALL',
#'   '^$',
#'   function(req) {
#'     if (!is.null(query(req))) {
#'       for (n in names(query(req))) {
#'         print(paste(n, query(req)[[n]]))
#'       }
#'     } else {
#'       print('The request did not contain a query')
#'     }
#'     
#'     response()
#'   }
#' )
query <- function(x) {
  assert_that(is.request(x))
  x$query
}
