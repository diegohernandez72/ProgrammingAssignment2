## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

##The first function, makeCacheMatrix creates a special matrix, which is really a list containing a function to
## set the value of the matrix
## get the value of the matrix
## set the value of the inverse
## get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL           ## initialize inverse as NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
}
    get <- function() x         ##function to get
    setInverse <- function(inverse) inv <<- inverse
    getInverse <- function() inv
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}

## Write a short comment describing this function
## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {          ##gets cache data
        ## Return a matrix that is the inverse of 'x'
    inv <- x$getInverse() ## checks if inverse has already been calculated
    if(!is.null(inv)) { ## checks if inv is NULL
        message("getting cached data") 
        return(inv)  ## returns inverse from cache data

}
    ## calculates the inverse of the data and sets the value of inv in the cache via the setInverse function
data <- x$get() 
inv <- solve(data, ...) ## calculates inverse value with solve function
x$setInverse(inv)  ## set inverse value in the cache
inv
}
