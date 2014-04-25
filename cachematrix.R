## Below are two functions that are used to create a special object that stores a numeric matrix and caches its inverse.

##
##  makeCacheMatrix
##  
##  Constructor for CacheMatrix
##  set and get store and retrieve the matrix x 
##  setInverse computes and caches the inverse of x
##  getInverse retrieves the cached inverse matrix if available

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setInverse <- function(solve) m <<- solve
  getInverse <- function() m
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


##
##  cacheSolve
##  
##  Calculates the inverse of a matrix stored in a CacheMatrix 
##  using that class's setInverse and getInverse methods. 
##  The cached inverse it retrieved by default if available. 
##  Otherwise, the inverse is computed and cached.

cacheSolve <- function(x, ...) {
  ## check whether a cached value for the inverse exists and return it if so
  m <- x$getInverse() 
  if(!is.null(m)) {
    message("getting cached data")
    return(m)  ## Return a matrix that is the inverse of 'x'
  }
  
  ## if no cached inverse exists, calculate the inverse, cache it, and return it
  data <- x$get()
  m <- solve(data, ...)
  x$setInverse(m)
  m  ## Return a matrix that is the inverse of 'x'
  
}
