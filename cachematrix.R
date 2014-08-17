## Put comments here that give an overall description of what your
## functions do

## function caches a matrix' inverse
## The inverse has to be set externally by calling $setinverse()
## No checking on contents or type of the variable set is performed
## when setting the inverse
##
##   subfunctions:
##               set(y) : set the value of the matrix to be y. y must be a matrix or NULL
##               get()  : get the matrix
##        setinverse(i) : set the cache value, no checks
##        getinverse()  : get the cached value

makeCacheMatrix <- function(x = matrix()) {

        # init cached value:
        inv <- NULL

        # Set new value for the matrix and() reset cached inverse
        set <- function(y) {
                # Test if y is a matrix
                stopifnot(is.matrix(y) || is.null(y))
                # new value 
                x <<- y

                # Reset cached inverse
                inv <<- NULL
        }

        # Get the matrix 
        get <- function() x

        # Set and get cached inverse value
        setinverse <- function(i) inv <<- i
        getinverse <- function() inv

        # return list with operations:
        list (set = set, get = get, setinverse = setinverse, getinverse = getinverse)

}

## Return the inverse of the matrix in a makeCacheMatrix object and cache the value 
## in the same object if not set.
## 
## Todo: decide (read in assignment) whether this is purely intended for the inverse
##       or the more general solve() case.
##       And document so

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        i <- x$getinverse()

        if (!is.null(i)) {
                # Return cached value:
                return(i)
        }
        
        # Get matrix, calculate the inverse using solve() and set the cache
        mat <- x$get()
        i <- solve(mat, ...)
        
        # Set cache
        x$setinverse(i)

        # Return calculated value:
        i
}


