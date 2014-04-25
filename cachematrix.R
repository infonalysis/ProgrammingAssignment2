## Below are two functions that are used to create a special object that stores a numeric matrix and caches its inverse.

##
##  makeCacheMatrix
##  
##  Creates a special "matrix", which is really a list containing a function to
##  1 set the value of the matrix
##  2 get the value of the matrix
##  3 set the value of the inverse
##  4 get the value of the inverse

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
##  Calculates the inverse of the special "matrix" created with makeCacheMatrix. 
##  If inverse has already been calculated, gets the inverse from the cache, 
##  otherwise, it calculates the inverse of the data and sets the value of the inverse in the cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getInverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setInverse(m)
        m

}
