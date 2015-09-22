library(dull)
context('response object')

test_that('$get and $set correctly access values', {
  res <- response$new(NULL)

  res$set('Content-Type', 'text/html')
  expect_equal(res$get('Content-Type'), 'text/html')
  expect_equal(res$get('content-type'), 'text/html')
  expect_equal(res$get('content-Type'), 'text/html')

  res$set('Warning', 'challenger approaching')
  expect_equal(res$get('Warning'), 'challenger approaching')

  expect_null(res$get('missing'))
})

test_that('$initialize sets defaults', {
  res <- response$new(NULL)

  expect_equal(res$get('content-type'), 'text/plain')
})

test_that('$append sets new value', {
  res <- response$new(NULL)

  res$append('Connection', 'close')
  res$append('Content-Length', 'over 9000')

  expect_equal(res$get('Connection'), 'close')
  expect_equal(res$get('Content-Length'), 'over 9000')

  res$append('content-length', '?! That\'s impossible!')
  expect_equal(res$get('Content-Length'), 'over 9000?! That\'s impossible!')
})

test_that('$attachment uses correct type and file name', {
  res <- response$new(NULL)

  res$attachment()
  expect_equal(res$get('content-disposition'), 'attachment')
  expect_equal(res$get('content-type'), 'text/plain')
  expect_null(res$get('warning'))

  res$attachment('./README.md')
  expect_equal(res$get('content-disposition'), 'attachment; filename="README.md"')
  expect_equal(res$get('content-type'), 'text/x-markdown')
})

test_that('$download sets correct disposition and file name when specified', {
  res <- response$new(NULL)

  expect_error(res$download('/path/to/distant/lands.txt'))

  # TODO: research "resolve" function in node "path" module, once added
  # $download can be better tested, see
  # https://github.com/strongloop/express/blob/master/lib/response.js#L523
})

